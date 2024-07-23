class LoginModel {
  const LoginModel({
    required this.emailAddress,
    required this.password,
  });
  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      emailAddress: map['emailAddress'] as String,
      password: map['password'] as String,
    );
  }

  final String emailAddress;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'emailAddress': emailAddress,
      'password': password,
    };
  }
}
