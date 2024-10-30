import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rdm_builder_customer/login/repository/repository.dart';

part 'login_state.dart';

typedef LoginDataFunction = void Function(UserEntity);

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginRepository,
    required this.loginDataSendToAuthCubit,
  }) : super(const LoginState());
  final LoginRepository loginRepository;
  final LoginDataFunction loginDataSendToAuthCubit;

  void isCheck(bool? newCheck) {
    emit(state.copyWith(isCheck: newCheck));
  }

  void isVisible(bool? newVisible) {
    emit(state.copyWith(isVisible: newVisible));
  }

  void email(String value) {
    final email = Email.dirty(value);

    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([email, state.password]),
      ),
    );
  }

  void password(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.email, password]),
      ),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(
      state.copyWith(
        socialLoginState: state.socialLoginState.toLoading(
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
              socialLoginState: state.socialLoginState.toFailure(
                error: 'Email not found',
              ),
            ),
          );
          return;
        }
        socialLogin(email);
      } else if (result.status != LoginStatus.cancelled) {
        emit(
          state.copyWith(
            socialLoginState: state.socialLoginState.toFailure(
              error: result.message,
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            socialLoginState: DataState.initial(),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          socialLoginState: state.socialLoginState.toFailure(
            error: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(
      state.copyWith(
        socialLoginState: state.socialLoginState.toLoading(
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
        socialLogin(user.email);
      } else {
        emit(
          state.copyWith(
            socialLoginState: DataState.initial(),
          ),
        );
      }
    } catch (e) {
      //socialLogin('faheemakram922@gmail.com');
      emit(
        state.copyWith(
          socialLoginState: state.socialLoginState.toFailure(
            error: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> socialLogin(String email) async {
    try {
      final data = await loginRepository.googleLogin(email);
      emit(
        state.copyWith(
          socialLoginState: state.socialLoginState.toLoaded(data: data),
        ),
      );
      loginDataSendToAuthCubit(data);
    } catch (e) {
      emit(
        state.copyWith(
          socialLoginState: state.socialLoginState.toFailure(error: e),
        ),
      );
    }
  }

  Future<void> loginWithEmailPassword() async {
    if (!state.status.isValidated) return;
    emit(
      state.copyWith(
        status: FormzStatus.submissionInProgress,
        loginDataState: state.loginDataState.toLoading(),
      ),
    );
    try {
      final data = await loginRepository.loginWithEmailPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
          loginDataState: state.loginDataState.toLoaded(data: data),
        ),
      );
      loginDataSendToAuthCubit(data);
    } on NoDataException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          loginDataState: state.loginDataState.toFailure(
            error: 'User not found',
          ),
        ),
      );
    } on UnauthorisedException catch (_) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          loginDataState: state.loginDataState.toFailure(
            error: 'Invalid credentials',
          ),
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
          loginDataState: state.loginDataState.toFailure(error: error),
        ),
      );
    }
  }
}
