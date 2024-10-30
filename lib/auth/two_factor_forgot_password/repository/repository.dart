abstract class TwoFactorForgotRepository {
  Future<String> otpPhoneNumber({required String otp});
  Future<String> otpEmail({required String otp});
  Future<String> authenticatorAppCode({required String code});
}
