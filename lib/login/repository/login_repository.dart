import 'package:common/http/http_client.dart';
import 'package:common/utils/utils.dart';
import 'package:rdm_builder_customer/login/repository/model/login_model.dart';
import 'package:rdm_builder_customer/login/repository/repository.dart';

class LoginRepositoryImp extends LoginRepository {
  LoginRepositoryImp({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<LoginModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    return httpClient.post<JsonObject>(
      path: '',
      body: {
        'email': email,
        'password': password,
      },
    ).then(
      (json) => $mapIt(
        json,
        (e) => LoginModel.fromJson(e['user'] as JsonObject),
      )!,
    );
  }
}
