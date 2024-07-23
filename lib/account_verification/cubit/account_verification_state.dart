part of 'account_verification_cubit.dart';

final class AccountVerificationState extends Equatable {
  const AccountVerificationState({
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  List<Object?> get props => [selectedIndex];
}
