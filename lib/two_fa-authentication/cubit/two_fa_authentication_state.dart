part of 'two_fa_authentication_cubit.dart';

class TwoFaAuthenticationState extends Equatable {
  const TwoFaAuthenticationState({
    this.selectedIndex = 0,
  });
  final int selectedIndex;

  @override
  List<Object?> get props => [selectedIndex];

  TwoFaAuthenticationState copyWith({
    int? selectedIndex,
  }) {
    return TwoFaAuthenticationState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
