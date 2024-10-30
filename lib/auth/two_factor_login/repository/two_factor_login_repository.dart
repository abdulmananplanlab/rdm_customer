import 'package:common/common.dart';
import 'package:rdm_builder_customer/api_end_points/api_end_points.dart';
import 'package:rdm_builder_customer/auth/two_factor_login/model/authenticator_model.dart';
import 'package:rdm_builder_customer/auth/two_factor_login/repository/repository.dart';

class TwoFactorLoginRepositoryImp extends TwoFactorLoginRepository {
  TwoFactorLoginRepositoryImp({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<String> loginPhoneNumberOtp({
    required String otp,
    required String token,
  }) {
    return httpClient.post(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      path: ApiEndpoints.phoneNumberOtp,
      body: {
        'phone_no': otp,
        'type': 'login',
        'user_type': 'customer',
      },
    );
  }

  @override
  Future<AuthenticatorLoginModel> generateQrImageForAuthenticatorLogin({
    String? token,
  }) {
    return httpClient
        .post<JsonObject>(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          path: ApiEndpoints.authenticatorQrImageGenerate,
          body: {
            'user_type': 'customer',
          },
        )
        .then(
          (result) => $mapIt(
            result,
            (e) => AuthenticatorLoginModel.fromJson(e['data'] as JsonObject),
          )!,
        );
  }

  @override
  Future<void> getTwoFaAuthenticatorCodeLogin({
    required String tokenCode,
    required String token,
  }) async {
    await httpClient.post<JsonObject>(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      path: ApiEndpoints.authVerify,
      body: {
        'user_type': 'customer',
        'token': tokenCode,
      },
    );
  }

  @override
  Future<void> phoneNumberOtpVerifiedLogin({
    required String phoneNumber,
    required String otp,
    required String token,
  }) {
    return httpClient.post<JsonObject>(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      path: ApiEndpoints.phoneNumberOtpVerified,
      body: {
        'phone_no': phoneNumber,
        'otp': otp,
      },
    );
  }
}
