import 'package:common/utils/utils.dart';

abstract class TwoFaAuthenticatorRepository {
  Future<QrModel> getTwoFaAuthenticator({
    required String token,
    required String tokenCode,
  });
}

class QrModel {
  const QrModel({
    required this.response,
  });

  factory QrModel.fromJson(Map<String, dynamic> json) {
    return QrModel(
      response: $cast(json['response']),
    );
  }

  final String? response;
}
