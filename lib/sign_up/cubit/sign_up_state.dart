part of 'sign_up_cubit.dart';

typedef SocialSignUpDataState = DataState<UserEntity>;

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
    this.getBuilderUserDataState = const DataState(),
    this.socialSignUpDataState = const SocialSignUpDataState(),
  });
  final General firstName;
  final General lastName;
  final Email email;
  final Password password;
  final FormzStatus status;
  final bool isVisible;
  final General emailOtp;
  final DataState<UserEntity> signUpState;
  final DataState<UserEntity> getBuilderUserDataState;
  final SocialSignUpDataState socialSignUpDataState;

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
        getBuilderUserDataState,
        socialSignUpDataState,
      ];

  SignUpState copyWith({
    General? firstName,
    General? lastName,
    Email? email,
    Password? password,
    FormzStatus? status,
    bool? isVisible,
    General? emailOtp,
    DataState<UserEntity>? signUpState,
    DataState<UserEntity>? getBuilderUserDataState,
    SocialSignUpDataState? socialSignUpDataState,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isVisible: isVisible ?? this.isVisible,
      emailOtp: emailOtp ?? this.emailOtp,
      signUpState: signUpState ?? this.signUpState,
      getBuilderUserDataState:
          getBuilderUserDataState ?? this.getBuilderUserDataState,
      socialSignUpDataState:
          socialSignUpDataState ?? this.socialSignUpDataState,
    );
  }

  List<FormzInput<dynamic, dynamic>> get inputs => [
        firstName,
        lastName,
        email,
        password,
      ];
}
