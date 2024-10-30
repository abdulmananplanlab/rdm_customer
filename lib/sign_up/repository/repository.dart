import 'dart:async';

import 'package:common/auth/api/api.dart';

abstract class SignUpRepository {
  Future<UserEntity> signUpWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
  Future<UserEntity> getBuilderUser({
    required String token,
    required String id,
  });

  Future<UserEntity> googleSignUp({
    required String companyName,
    required String email,
  });
}
