part of 'two_fa_authentication_app_cubit.dart';

typedef TwoFactorActivationDataSate = DataState<QrModel>;

final class TwoFaAuthenticationAppState extends Equatable {
  const TwoFaAuthenticationAppState({
    this.secret = '',
    this.token = const General.pure(),
    this.dataState = const DataState(),
    this.status = FormzStatus.pure,
  });
  final String secret;
  final General token;
  final FormzStatus status;
  final TwoFactorActivationDataSate dataState;
  @override
  List<Object?> get props => [
        secret,
        token,
        dataState,
        status,
      ];

  TwoFaAuthenticationAppState copyWith({
    String? secret,
    General? token,
    FormzStatus? status,
    TwoFactorActivationDataSate? dataState,
  }) {
    return TwoFaAuthenticationAppState(
      secret: secret ?? this.secret,
      token: token ?? this.token,
      status: status ?? this.status,
      dataState: dataState ?? this.dataState,
    );
  }
}
