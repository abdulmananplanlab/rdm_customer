part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    this.status = FormzStatus.pure,
    this.newPassword = const Password.pure(),
    this.confirmPassword = const Password.pure(),
    this.isNewPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });
  final FormzStatus status;
  final Password newPassword;
  final Password confirmPassword;
  final bool isNewPasswordVisible;
  final bool isConfirmPasswordVisible;

  ForgetPasswordState copyWith({
    FormzStatus? status,
    Password? newPassword,
    Password? confirmPassword,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return ForgetPasswordState(
      status: status ?? this.status,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
        status,
        newPassword,
        isNewPasswordVisible,
        confirmPassword,
        isConfirmPasswordVisible,
      ];

  FormzStatus validWith({
    Password? newPassword,
    Password? confirmPassword,
  }) {
    final status = Formz.validate([
      newPassword ?? this.newPassword,
      confirmPassword ?? this.confirmPassword,
    ]);
    final bool isSame = (newPassword ?? this.newPassword).value ==
        (confirmPassword ?? this.confirmPassword).value;
    if (status == FormzStatus.valid && isSame) {
      return FormzStatus.valid;
    } else {
      return FormzStatus.invalid;
    }
  }
}
