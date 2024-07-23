import 'package:rdm_builder_customer/sign_up/repository/model/sign_up_model.dart';

abstract class SignUpRepository {
  Future<SignUpModel> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<String> signUpEmailOtp({required String otp});
}
