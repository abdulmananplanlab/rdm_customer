import 'package:common/common.dart';
import 'package:rdm_builder_customer/auth/two_factor_forgot_password/repository/repository.dart';

class TwoFactorForgotRepositoryImp extends TwoFactorForgotRepository {
  TwoFactorForgotRepositoryImp({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<String> otpPhoneNumber({required String otp}) {
    return httpClient.put(
      path: 'path',
      body: {
        'otp': otp,
      },
    );
  }

  @override
  Future<String> otpEmail({required String otp}) {
    return httpClient.put(
      path: 'path',
      body: {
        'otp': otp,
      },
    );
  }

  @override
  Future<String> authenticatorAppCode({required String code}) {
    return httpClient.put(
      path: 'path',
      body: {
        'code': code,
      },
    );
  }
}
