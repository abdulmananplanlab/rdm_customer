import 'package:common/common.dart';
import 'package:rdm_builder_customer/api_end_points/api_end_points.dart';
import 'package:rdm_builder_customer/sign_up/repository/repository.dart';

class SignUpRepositoryImp extends SignUpRepository {
  SignUpRepositoryImp({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<UserEntity> signUpWithEmailPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    final authUser = httpClient.post<JsonObject>(
      path: ApiEndpoints.signUp,
      body: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
      },
    ).then(
      (json) => $mapIt(
        json,
        (e) => UserEntity.fromJson(
          e['data']['user'] as JsonObject,
          e['data']['token'] as String,
        ),
      )!,
    );
    return authUser;
  }

  @override
  Future<UserEntity> getBuilderUser({
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
          '',
        ),
      )!,
    );
  }

  @override
  Future<UserEntity> googleSignUp({
    required String companyName,
    required String email,
  }) async {
    return httpClient.post<JsonObject>(
      path: ApiEndpoints.googleSignUp,
      body: {
        'company_name': companyName,
        'email': email,
      },
    ).then(
      (json) => $mapIt(
        json,
        (e) => UserEntity.fromJson(
          e['data']['builder'] as JsonObject,
          e['data']['token'] as String,
        ),
      )!,
    );
  }
}
