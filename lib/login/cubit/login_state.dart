part of 'login_cubit.dart';

typedef LoginDataState = DataState<UserEntity>;
typedef SocialLoginState = DataState<UserEntity>;

class LoginState extends Equatable {
  const LoginState({
    this.isVisible = false,
    this.isCheck = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.loginDataState = const DataState(),
    this.socialLoginState = const DataState(),
  });
  final bool isCheck;
  final bool isVisible;
  final FormzStatus status;
  final Email email;
  final Password password;
  final LoginDataState loginDataState;
  final SocialLoginState socialLoginState;

  @override
  List<Object?> get props => [
        isCheck,
        email,
        password,
        status,
        isVisible,
        loginDataState,
        socialLoginState,
      ];

  LoginState copyWith({
    bool? isCheck,
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? isVisible,
    LoginDataState? loginDataState,
    SocialLoginState? socialLoginState,
  }) {
    return LoginState(
      isCheck: isCheck ?? this.isCheck,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isVisible: isVisible ?? this.isVisible,
      loginDataState: loginDataState ?? this.loginDataState,
      socialLoginState: socialLoginState ?? this.socialLoginState,
    );
  }

  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];

  bool get isLoginSuccessFull =>
      loginDataState.isLoaded &&
      loginDataState.data != null &&
      loginDataState.data!.token!.notBlank != null;

  bool get isSocialLoginSuccessFull =>
      socialLoginState.isLoaded &&
      socialLoginState.data != null &&
      socialLoginState.data!.token!.notBlank != null;

  UserEntity get user => loginDataState.data ?? socialLoginState.data!;
}
