import 'package:common/auth/api/entity/entity.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/model/authenticator_model.dart';

abstract class TwoFactorSignRepository {
  Future<void> verificationCodeGenerate({
    required String email,
    required String token,
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

  Future<UserEntity> getUser({
    required String token,
    required String id,
  });
}
