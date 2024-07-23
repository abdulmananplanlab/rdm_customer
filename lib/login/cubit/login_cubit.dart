import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rdm_builder_customer/login/repository/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(const LoginState());
  final LoginRepository loginRepository;
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        '888907195100-jsf1scci4k6q4t32ptih5mobig6q45f4.apps.googleusercontent.com',
    scopes: ['email'],
  );

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

  Future<void> loginWithGoogle() async {
    try {
      await googleSignIn.signOut();
      final GoogleSignInAccount? user = await googleSignIn.signIn();
      log(user!.displayName.toString());
      emit(
        state.copyWith(
          loginDataState: state.loginDataState.toLoaded(data: user),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loginDataState: state.loginDataState.toFailure(
            error: e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> login() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await loginRepository.loginWithEmailPassword(
          email: state.email.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
