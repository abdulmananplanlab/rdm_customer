import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/forget_password/repository/repository.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgotPasswordRepository})
      : super(const ForgetPasswordState());

  final ForgotPasswordRepository forgotPasswordRepository;

  void newPasswordVisibilityChanged() {
    emit(
      state.copyWith(
        isNewPasswordVisible: !state.isNewPasswordVisible,
      ),
    );
  }

  void confirmPasswordVisibilityChanged() {
    emit(
      state.copyWith(
        isConfirmPasswordVisible: !state.isConfirmPasswordVisible,
      ),
    );
  }

  void newPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        newPassword: password,
        status: state.validWith(
          newPassword: password,
        ),
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        confirmPassword: password,
        status: state.validWith(
          confirmPassword: password,
        ),
      ),
    );
  }

  Future<void> resetPassword() async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await forgotPasswordRepository.resetPassword(
          password: state.newPassword.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
