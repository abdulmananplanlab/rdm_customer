import 'package:common/common.dart';
import 'package:rdm_builder_customer/app/slack_api_end_points/slack_api_end_points.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/model/authenticator_model.dart';
import 'package:rdm_builder_customer/auth/two_factor_sign_up/model/magic_link_model.dart';
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
      path: SlackApiEndpoints.phoneNumberOtp,
      body: {
        'phone_no': otp,
        'user_type': 'builder',
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
  Future<MagicLinkModel> verificationCodeGenerate({
    required String email,
  }) {
    return httpClient.post<JsonObject>(
      path: SlackApiEndpoints.verificationCodeGenerate,
      body: {
        'type': 'builder',
        'email': email,
      },
    ).then(
      (json) => $mapIt(
        json,
        (it) => MagicLinkModel.fromJson(it as JsonObject),
      )!,
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
          path: SlackApiEndpoints.authenticatorQrImageGenerate,
          body: {
            'user_type': 'builder',
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
      path: SlackApiEndpoints.phoneNumberOtpVerified,
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
          path: SlackApiEndpoints.authenticatorQrSecretGenerate,
          body: {
            'user_type': 'builder',
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
}
