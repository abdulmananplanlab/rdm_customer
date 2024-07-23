import 'package:common/common.dart';
import 'package:rdm_builder_customer/forget_password/repository/repository.dart';

class ForgotPasswordRepositoryImp extends ForgotPasswordRepository {
  ForgotPasswordRepositoryImp({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<String> resetPassword({required String password}) {
    return httpClient.put(
      path: 'path',
      body: {
        'password': password,
      },
    );
  }
}
