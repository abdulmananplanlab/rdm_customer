import 'package:common/common.dart';
import 'package:rdm_builder_customer/app/slack_api_end_points/slack_api_end_points.dart';
import 'package:rdm_builder_customer/sign_up/repository/model/sign_up_model.dart';
import 'package:rdm_builder_customer/sign_up/repository/repository.dart';

class SignUpRepositoryImp extends SignUpRepository {
  SignUpRepositoryImp({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<SignUpModel> signUpWithEmailPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) {
    final authUser = httpClient.post<JsonObject>(
      path: SlackApiEndpoints.signUp,
      body: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
      },
    ).then(
      (json) => $mapIt(
        json,
        (e) => SignUpModel.fromJson(
          e['data']['user'] as JsonObject,
          e['data']['token'] as String,
        ),
      )!,
    );
    return authUser;
  }

  @override
  Future<String> signUpEmailOtp({required String otp}) {
    return httpClient.put(
      path: '',
      body: {
        'otp': otp,
      },
    );
  }
}
