import 'package:common/common.dart';
import 'package:rdm_builder_customer/api_end_points/api_end_points.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/model/authenticator_model.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/repository/repository.dart';

class TwoFactorSignRepositoryImp extends TwoFactorSignRepository {
  TwoFactorSignRepositoryImp({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<String> phoneNumberOtpSignUp({
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
        'user_type': 'customer',
        'type': 'sign-up',
      },
    );
  }

  @override
  Future<String> authenticatorOtpSignUp({required String code}) {
    return httpClient.put(
      path: '',
      body: {'otp': code},
    );
  }

  @override
  Future<void> verificationCodeGenerate({
    required String email,
    required String token,
  }) {
    return httpClient.post<JsonObject>(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      path: ApiEndpoints.generateMagicLink,
      body: {
        'type': 'customer',
        'email': email,
      },
    );
  }

  @override
  Future<AuthenticatorModel> authenticatorQrImageSignUp({
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
            (e) => AuthenticatorModel.fromJson(e['data'] as JsonObject, ''),
          )!,
        );
  }

  @override
  Future<void> phoneNumberOtpVerified({
    required String phoneNumber,
    required String otp,
    required String token,
  }) async {
    await httpClient.post<JsonObject>(
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

  @override
  Future<AuthenticatorModel> authenticatorSecretKeySignUp({String? token}) {
    return httpClient
        .post<JsonObject>(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          path: ApiEndpoints.authenticatorQrSecretGenerate,
          body: {
            'user_type': 'customer',
          },
        )
        .then(
          (result) => $mapIt(
            result,
            (it) => AuthenticatorModel.fromJson(
              it as JsonObject,
              result['data'] as String,
            ),
          )!,
        );
  }

  @override
  Future<UserEntity> getUser({
    required String token,
    required String id,
  }) {
    return httpClient.get<JsonObject>(
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      path: '${ApiEndpoints.getCustomerUser}/$id',
    ).then(
      (json) => $mapIt(
        json,
        (it) => UserEntity.fromJson(
          it['data'] as JsonObject,
          token,
        ),
      )!,
    );
  }
}
