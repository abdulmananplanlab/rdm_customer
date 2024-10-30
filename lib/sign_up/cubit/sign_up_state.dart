part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.isVisible = false,
    this.firstName = const General.pure(),
    this.lastName = const General.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.emailOtp = const General.pure(),
    this.signUpState = const DataState(),
  });
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool isVisible;
  final General emailOtp;
  final DataState<SignUpModel> signUpState;
  final General firstName;
  final General lastName;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        status,
        isVisible,
        emailOtp,
        signUpState,
      ];

  SignUpState copyWith({
    General? lastName,
    General? firstName,
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? isVisible,
    General? emailOtp,
    DataState<SignUpModel>? signUpState,
  }) {
    return SignUpState(
      lastName: lastName ?? this.lastName,
      firstName: firstName ?? this.firstName,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isVisible: isVisible ?? this.isVisible,
      emailOtp: emailOtp ?? this.emailOtp,
      signUpState: signUpState ?? this.signUpState,
    );
  }

  List<FormzInput<dynamic, dynamic>> get inputs => [
        firstName,
        lastName,
        email,
        password,
      ];
}
