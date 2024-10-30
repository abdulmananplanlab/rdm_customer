import 'package:common/common.dart';
import 'package:rdm_builder_customer/api_end_points/api_end_points.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/repository/two_fa_authenticator_repository.dart';

class TwoFaAuthenticatorRepositoryImpl implements TwoFaAuthenticatorRepository {
  const TwoFaAuthenticatorRepositoryImpl({required this.httpClient});

  final HttpClient httpClient;
  @override
  Future<QrModel> getTwoFaAuthenticator({
    required String tokenCode,
    required String token,
  }) {
    return httpClient.post<JsonObject>(
      path: ApiEndpoints.authVerify,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'user_type': 'customer',
        'token': tokenCode,
      },
    ).then(
      (json) => $mapIt(
        json,
        (it) => QrModel.fromJson(it as JsonObject),
      )!,
    );
  }
}
