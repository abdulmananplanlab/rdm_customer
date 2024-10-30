import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rdm_builder_customer/sign_up/repository/repository.dart';

part 'sign_up_state.dart';

typedef SignModelData = void Function(UserEntity);

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required this.signUpRepository,
    required this.authCubit,
    required this.authRepository,
  }) : super(const SignUpState());
  final SignUpRepository signUpRepository;
  final AuthRepository authRepository;
  final SignModelData authCubit;

  void isVisible(bool? newVisible) {
    emit(state.copyWith(isVisible: newVisible));
  }

  void firstName(String value) {
    final firstName = General.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
        status: Formz.validate(
            [firstName, state.email, state.password, state.lastName]),
      ),
    );
  }

  void lastName(String value) {
    final lastName = General.dirty(value);
    emit(
      state.copyWith(
        lastName: lastName,
        status: Formz.validate(
            [lastName, state.email, state.password, state.firstName]),
      ),
    );
  }

  void email(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
            [email, state.firstName, state.password, state.lastName]),
      ),
    );
  }

  void password(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
            [password, state.email, state.firstName, state.lastName]),
      ),
    );
  }

// this is for sign up with email
  Future<void> signUpWithEmail() async {
    if (!state.status.isValidated) return;

    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        signUpState: state.signUpState.toLoading(),
      ),
    );
    try {
      final data = await signUpRepository.signUpWithEmailPassword(
        firstName: state.firstName.value,
        lastName: state.lastName.value,
        email: state.email.value,
        password: state.password.value,
      );

      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          signUpState: state.signUpState.toLoaded(
            data: data,
          ),
        ),
      );
      authCubit(data);
    } on NoDataException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          signUpState: state.signUpState.toFailure(
            error: 'Builder already exists with this email.',
          ),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          signUpState: state.signUpState.toFailure(
            error: error,
          ),
        ),
      );
    }
  }

  void startTimer() {
    Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        if (state.getBuilderUserDataState.data?.isEmailVerified ?? false) {
          timer.cancel();
        } else {
          getBuilderUser();
        }
      },
    );
  }

  Future<void> getBuilderUser() async {
    emit(
      state.copyWith(
        getBuilderUserDataState: state.getBuilderUserDataState.toLoading(),
      ),
    );
    try {
      final data = await signUpRepository.getBuilderUser(
        token: state.signUpState.data?.token ?? 'No Token ',
        id: state.signUpState.data?.id ?? 'No Id',
      );
      emit(
        state.copyWith(
          getBuilderUserDataState:
              state.getBuilderUserDataState.toLoaded(data: data),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          getBuilderUserDataState:
              state.getBuilderUserDataState.toFailure(error: e),
        ),
      );
    }
  }

  Future<void> signUpWithGoogle() async {
    emit(
      state.copyWith(
        socialSignUpDataState: state.socialSignUpDataState.toLoading(
          key: 'google',
        ),
      ),
    );
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: Platform.isIOS
            ? '502732760713-rk6gsqooougm0c1kgjrq0fequ840hqvq.apps.googleusercontent.com'
            : null,
        scopes: ['email'],
      );
      await googleSignIn.signOut();
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      if (user != null) {
        $debugLog(user.email);
        socialSignup(user.email);
      } else {
        emit(
          state.copyWith(
            socialSignUpDataState: DataState.initial(),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          socialSignUpDataState: state.socialSignUpDataState.toFailure(
            error: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> signUpWithFacebook() async {
    emit(
      state.copyWith(
        socialSignUpDataState: state.socialSignUpDataState.toLoading(
          key: 'facebook',
        ),
      ),
    );
    try {
      await FacebookAuth.instance.logOut();
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();
        $debugLog(result.accessToken);
        $debugLog(userData);
        var email = $cast<String>(userData['email']);
        if (email == null) {
          if ($cast<String>(userData['id']) != null) {
            email = '${userData['id']}@facebook.com';
          }
        }
        if (email == null) {
          emit(
            state.copyWith(
              socialSignUpDataState: state.socialSignUpDataState.toFailure(
                error: 'Email not found',
              ),
            ),
          );
          return;
        }
        socialSignup(email);
      } else if (result.status != LoginStatus.cancelled) {
        emit(
          state.copyWith(
            socialSignUpDataState: state.socialSignUpDataState.toFailure(
              error: result.message,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            socialSignUpDataState: DataState.initial(),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          socialSignUpDataState: state.socialSignUpDataState.toFailure(
            error: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> socialSignup(String email) async {
    try {
      final data = await signUpRepository.googleSignUp(
        companyName: 'companyName',
        email: 'j$email',
      );
      emit(
        state.copyWith(
          socialSignUpDataState:
              state.socialSignUpDataState.toLoaded(data: data),
        ),
      );
      authCubit(data);
    } catch (e) {
      emit(
        state.copyWith(
          socialSignUpDataState:
              state.socialSignUpDataState.toFailure(error: e),
        ),
      );
    }
  }
}
