part of 'verify_email_cubit.dart';

class VerifyEmailState extends Equatable {
  const VerifyEmailState({
    this.email = const Email.pure(),
    this.status = FormzStatus.pure,
  });
  final Email email;
  final FormzStatus status;
  @override
  List<Object?> get props => [email, status];

  VerifyEmailState copyWith({
    Email? email,
    FormzStatus? status,
  }) {
    return VerifyEmailState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  List<FormzInput<dynamic, dynamic>> get inputs => [email];
}
