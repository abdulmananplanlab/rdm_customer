import 'package:rdm_builder_customer/auth/two_factor_sign_up/model/authenticator_model.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/model/magic_link_model.dart';

abstract class TwoFactorSignRepository {
  Future<MagicLinkModel> verificationCodeGenerate({
    required String email,
  });
  Future<String> phoneNumberOtpSignUp({
    required String otp,
    required String token,
  });
  Future<void> phoneNumberOtpVerified({
    required String phoneNumber,
    required String otp,
    required String token,
  });
  Future<AuthenticatorModel> authenticatorQrImageSignUp({String? token});
  Future<AuthenticatorModel> authenticatorSecretKeySignUp({String? token});
  Future<String> authenticatorOtpSignUp({required String code});
}
