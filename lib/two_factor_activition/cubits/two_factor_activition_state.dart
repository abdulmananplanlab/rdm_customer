part of 'two_factor_activition_cubit.dart';

typedef TwoFactorActivationDataSate = DataState<void>;

class TwoFactorActivationState extends Equatable {
  const TwoFactorActivationState({
    required this.selectedCountry,
  });

  final Country selectedCountry;

  TwoFactorActivationState copyWith({
    Country? selectedCountry,
  }) {
    return TwoFactorActivationState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }

  @override
  List<Object?> get props => [selectedCountry];
}
