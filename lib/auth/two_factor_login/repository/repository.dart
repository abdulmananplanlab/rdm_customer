import 'package:rdm_builder_customer/auth/two_factor_login/model/authenticator_model.dart';

abstract class TwoFactorLoginRepository {
  Future<String> loginPhoneNumberOtp({
    required String otp,
    required String token,
  });

  Future<void> phoneNumberOtpVerifiedLogin({
    required String phoneNumber,
    required String otp,
    required String token,
  });

  Future<AuthenticatorLoginModel> generateQrImageForAuthenticatorLogin({
    String? token,
  });
  Future<void> getTwoFaAuthenticatorCodeLogin({
    required String tokenCode,
    required String token,
  });
}
