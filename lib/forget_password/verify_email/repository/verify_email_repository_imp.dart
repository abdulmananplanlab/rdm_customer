import 'package:common/http/http_client.dart' show HttpClient;
import 'package:rdm_builder_customer/forget_password/verify_email/repository/repository.dart';

class VerifyEmailRepositoryImp extends VerifyEmailRepository {
  VerifyEmailRepositoryImp({required this.httpClient});
  final HttpClient httpClient;
  @override
  Future<String> verifyEmail({required String email}) {
    return httpClient.put(
      path: 'path',
      body: {
        'email': email,
      },
    );
  }
}
