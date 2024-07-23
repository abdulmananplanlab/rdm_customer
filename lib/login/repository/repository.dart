import 'package:rdm_builder_customer/login/repository/model/login_model.dart';

abstract class LoginRepository {
  Future<LoginModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
