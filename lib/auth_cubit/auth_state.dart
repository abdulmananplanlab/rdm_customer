part of 'auth_cubit.dart';

typedef PhoneNumberSignUpDataSate = DataState<void>;
typedef PhoneNumberLoginDataSate = DataState<void>;
typedef AuthenticatorQrImageSignUpDataSate = DataState<AuthenticatorModel>;
typedef AuthenticatorQrSecretKeySignUpDataSate = DataState<AuthenticatorModel>;
typedef AuthenticatorLoginDataSate = DataState<AuthenticatorLoginModel>;
typedef SignUpDataSate = DataState<SignUpModel>;
typedef LoginDataSate = DataState<LoginModel>;
typedef PhoneNumberOtpSignUpVerifiedDataState = DataState<void>;
typedef PhoneNumberOtpLoginVerifiedDataState = DataState<void>;
typedef MagicLinkSendDataState = DataState<void>;

class AuthState extends Equatable {
  const AuthState({
    this.otpPhoneNumberForgot = const General.pure(),
    this.otpEmailForgot = const General.pure(),
    this.authenticatorCodeForgot = const General.pure(),
    this.status = FormzStatus.pure,
    this.otpPhoneNumberVerifiedLogin = const General.pure(),
    this.authenticatorCodeLogin = const General.pure(),
    this.otpPhoneNumberSignUp = const PhoneNumber.pure(),
    this.authenticatorCodeSignUp = const General.pure(),
    this.phoneNumberSignUpDataSate = const DataState(),
    this.phoneNumberLoginDataSate = const DataState(),
    this.qrImageSignUpDataSate = const DataState(),
    this.qrCodeUrl = '',
    this.secret = '',
    this.token = const General.pure(),
    this.signUpDataSate = const DataState(),
    this.loginDataState = const DataState(),
    this.otpSignUpVerifiedDataState = const DataState(),
    this.otpSignUpPhoneVerified = const General.pure(),
    this.authenticatorLoginDataSate = const DataState(),
    this.secretKeySignUpDataSate = const DataState(),
    this.isLoading = false,
    this.otpLoginVerifiedDataState = const DataState(),
    this.magicLinkSendDataState = const DataState(),
  });

  final General otpPhoneNumberForgot;
  final General otpEmailForgot;
  final General authenticatorCodeForgot;
  final General otpPhoneNumberVerifiedLogin;
  final General authenticatorCodeLogin;
  final PhoneNumber otpPhoneNumberSignUp;
  final General authenticatorCodeSignUp;
  final String qrCodeUrl;
  final String secret;
  final General token;
  final FormzStatus status;
  final General otpSignUpPhoneVerified;
  final bool isLoading;

  final PhoneNumberSignUpDataSate phoneNumberSignUpDataSate;
  final PhoneNumberLoginDataSate phoneNumberLoginDataSate;
  final AuthenticatorQrImageSignUpDataSate qrImageSignUpDataSate;
  final AuthenticatorQrSecretKeySignUpDataSate secretKeySignUpDataSate;
  final AuthenticatorLoginDataSate authenticatorLoginDataSate;
  final SignUpDataSate signUpDataSate;
  final LoginDataSate loginDataState;
  final PhoneNumberOtpSignUpVerifiedDataState otpSignUpVerifiedDataState;
  final PhoneNumberOtpLoginVerifiedDataState otpLoginVerifiedDataState;
  final MagicLinkSendDataState magicLinkSendDataState;

  AuthState copyWith({
    Email? email,
    Password? password,
    Email? signEmail,
    Password? signPassword,
    General? companyName,
    Email? forgotEmail,
    General? otpPhoneNumberForgot,
    General? otpEmailForgot,
    General? authenticatorCodeForgot,
    General? resetPassword,
    FormzStatus? status,
    General? otpPhoneNumberVerifiedLogin,
    General? authenticatorCodeLogin,
    PhoneNumber? otpPhoneNumberSignUp,
    General? authenticatorCodeSignUp,
    PhoneNumberSignUpDataSate? phoneNumberSignUpDataSate,
    PhoneNumberLoginDataSate? phoneNumberLoginDataSate,
    AuthenticatorQrImageSignUpDataSate? qrImageSignUpDataSate,
    AuthenticatorQrSecretKeySignUpDataSate? secretKeySignUpDataSate,
    SignUpDataSate? signUpDataSate,
    String? qrCodeUrl,
    General? token,
    String? secret,
    PhoneNumberOtpSignUpVerifiedDataState? otpSignUpVerifiedDataState,
    General? otpSignUpPhoneVerified,
    LoginDataSate? loginDataState,
    AuthenticatorLoginDataSate? authenticatorLoginDataSate,
    bool? isLoading,
    PhoneNumberOtpLoginVerifiedDataState? otpLoginVerifiedDataState,
    MagicLinkSendDataState? magicLinkSendDataState,
  }) {
    return AuthState(
      otpPhoneNumberForgot: otpPhoneNumberForgot ?? this.otpPhoneNumberForgot,
      otpEmailForgot: otpEmailForgot ?? this.otpEmailForgot,
      authenticatorCodeForgot:
          authenticatorCodeForgot ?? this.authenticatorCodeForgot,
      status: status ?? this.status,
      otpPhoneNumberVerifiedLogin:
          otpPhoneNumberVerifiedLogin ?? this.otpPhoneNumberVerifiedLogin,
      authenticatorCodeLogin:
          authenticatorCodeLogin ?? this.authenticatorCodeLogin,
      otpPhoneNumberSignUp: otpPhoneNumberSignUp ?? this.otpPhoneNumberSignUp,
      authenticatorCodeSignUp:
          authenticatorCodeSignUp ?? this.authenticatorCodeSignUp,
      phoneNumberSignUpDataSate:
          phoneNumberSignUpDataSate ?? this.phoneNumberSignUpDataSate,
      phoneNumberLoginDataSate:
          phoneNumberLoginDataSate ?? this.phoneNumberLoginDataSate,
      qrImageSignUpDataSate:
          qrImageSignUpDataSate ?? this.qrImageSignUpDataSate,
      secretKeySignUpDataSate:
          secretKeySignUpDataSate ?? this.secretKeySignUpDataSate,
      signUpDataSate: signUpDataSate ?? this.signUpDataSate,
      qrCodeUrl: qrCodeUrl ?? this.qrCodeUrl,
      secret: secret ?? this.secret,
      otpSignUpVerifiedDataState:
          otpSignUpVerifiedDataState ?? this.otpSignUpVerifiedDataState,
      otpSignUpPhoneVerified:
          otpSignUpPhoneVerified ?? this.otpSignUpPhoneVerified,
      loginDataState: loginDataState ?? this.loginDataState,
      authenticatorLoginDataSate:
          authenticatorLoginDataSate ?? this.authenticatorLoginDataSate,
      token: token ?? this.token,
      isLoading: isLoading ?? this.isLoading,
      otpLoginVerifiedDataState:
          otpLoginVerifiedDataState ?? this.otpLoginVerifiedDataState,
      magicLinkSendDataState:
          magicLinkSendDataState ?? this.magicLinkSendDataState,
    );
  }

  @override
  List<Object?> get props => [
        otpPhoneNumberForgot,
        otpEmailForgot,
        authenticatorCodeForgot,
        status,
        otpPhoneNumberVerifiedLogin,
        authenticatorCodeLogin,
        otpPhoneNumberSignUp,
        authenticatorCodeSignUp,
        phoneNumberSignUpDataSate,
        phoneNumberLoginDataSate,
        qrCodeUrl,
        secret,
        qrImageSignUpDataSate,
        signUpDataSate,
        otpSignUpVerifiedDataState,
        otpSignUpPhoneVerified,
        loginDataState,
        authenticatorLoginDataSate,
        token,
        secretKeySignUpDataSate,
        isLoading,
        otpLoginVerifiedDataState,
        magicLinkSendDataState,
      ];

  FormzStatus validWith(
    PhoneNumber? otpPhoneNumberSignUp,
    General? otpSignUpPhoneVerified,
    General? otpPhoneNumberVerifiedLogin,
    General? token,
  ) {
    return Formz.validate([
      PhoneNumber.dirty(
        otpPhoneNumberSignUp?.value ?? this.otpPhoneNumberSignUp.value,
      ),
      General.dirty(
        otpSignUpPhoneVerified?.value ?? this.otpSignUpPhoneVerified.value,
      ),
      General.dirty(
        otpPhoneNumberVerifiedLogin?.value ??
            this.otpPhoneNumberVerifiedLogin.value,
      ),
      General.dirty(
        token?.value ?? this.token.value,
      ),
    ]);
  }
}
