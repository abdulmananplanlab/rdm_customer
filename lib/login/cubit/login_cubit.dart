// import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:rdm_builder_customer/login/repository/model/login_model.dart';
import 'package:rdm_builder_customer/login/repository/repository.dart';

part 'login_state.dart';

typedef LoginDataFunction = void Function(LoginModel);

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

  // Future<void> loginWithGoogle() async {
  //   try {
  //     final GoogleSignIn googleSignIn = GoogleSignIn(
  //       clientId: Platform.isIOS
  //           ? '502732760713-rk6gsqooougm0c1kgjrq0fequ840hqvq.apps.googleusercontent.com'
  //           : null,
  //       scopes: ['email'],
  //     );
  //     await googleSignIn.signOut();
  //     final GoogleSignInAccount? user = await googleSignIn.signIn();
  //     $debugLog(user);
  //     $debugLog(user);
  //     emit(
  //       state.copyWith(
  //         loginDataState: state.loginDataState.toLoaded(data: user),
  //       ),
  //     );
  //   } catch (e) {
  //     $debugLog(e);
  //     $debugLog(e);
  //     emit(
  //       state.copyWith(
  //         loginDataState: state.loginDataState.toFailure(
  //           error: e.toString(),
  //         ),
  //       ),
  //     );
  //   }
  // }

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
