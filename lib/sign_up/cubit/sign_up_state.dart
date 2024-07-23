part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.isVisible = false,
    this.lastName = const General.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.emailOtp = const General.pure(),
    this.firstName = const General.pure(),
  });
  final General firstName;
  final General lastName;
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool isVisible;
  final General emailOtp;

  @override
  List<Object?> get props => [
        lastName,
        email,
        password,
        status,
        isVisible,
        emailOtp,
        firstName,
      ];

  SignUpState copyWith({
    General? lastName,
    General? firstName,
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? isVisible,
    General? emailOtp,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isVisible: isVisible ?? this.isVisible,
      emailOtp: emailOtp ?? this.emailOtp,
    );
  }

  List<FormzInput<dynamic, dynamic>> get inputs => [
        firstName,
        lastName,
        email,
        password,
      ];
}
