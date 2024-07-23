import 'package:common/common.dart';
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
    return httpClient.post<JsonObject>(
      path: '',
      body: {
        'email': email,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
      },
    ).then(
      (json) => $mapIt(
        json,
        (e) => SignUpModel.fromJson((e as JsonObject)['user'] as JsonObject),
      )!,
    );
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
