part of 'login_cubit.dart';

typedef LoginDataState = DataState<dynamic>;

class LoginState extends Equatable {
  const LoginState({
    this.isVisible = false,
    this.isCheck = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.loginDataState = const DataState.initial(),
  });
  final bool isCheck;
  final bool isVisible;
  final FormzStatus status;
  final Email email;
  final Password password;
  final LoginDataState loginDataState;

  @override
  List<Object?> get props => [
        isCheck,
        email,
        password,
        status,
        isVisible,
        loginDataState,
      ];

  LoginState copyWith({
    bool? isCheck,
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? isVisible,
    LoginDataState? loginDataState,
  }) {
    return LoginState(
      isCheck: isCheck ?? this.isCheck,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isVisible: isVisible ?? this.isVisible,
      loginDataState: loginDataState ?? this.loginDataState,
    );
  }

  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
