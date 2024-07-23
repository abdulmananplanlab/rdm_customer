import 'package:common/common.dart';

class SignUpModel {
  const SignUpModel({
    required this.firstName,
    required this.email,
    required this.password,
    required this.lastName,
  });

  factory SignUpModel.fromJson(JsonObject map) {
    return SignUpModel(
      firstName: map['firstName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      lastName: map['lastName'] as String,
    );
  }
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
