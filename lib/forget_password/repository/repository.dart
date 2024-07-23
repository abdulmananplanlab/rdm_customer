abstract class ForgotPasswordRepository {
  Future<String> resetPassword({required String password});
}
