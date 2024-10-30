import 'package:common/common.dart';

class AuthenticatorLoginModel {
  const AuthenticatorLoginModel({
    required this.qrCodeUrl,
  });

  factory AuthenticatorLoginModel.fromJson(Map<String, dynamic> json) {
    return AuthenticatorLoginModel(
      qrCodeUrl: $cast(json['qr_code']),
    );
  }
  final String? qrCodeUrl;

  Map<String, dynamic> toJson() {
    return {
      'qr_code': qrCodeUrl,
    };
  }
}
