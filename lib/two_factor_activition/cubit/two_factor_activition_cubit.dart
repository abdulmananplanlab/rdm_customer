import 'package:bloc/bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';

part 'two_factor_activition_state.dart';

class TwoFactorActivationCubit extends Cubit<TwoFactorActivationState> {
  TwoFactorActivationCubit()
      : super(
          TwoFactorActivationState(
            selectedCountry: Country(
              e164Sc: 1,
              phoneCode: '1',
              countryCode: 'US',
              name: 'United States',
              geographic: true,
              level: 2,
              example: '',
              displayName: '',
              displayNameNoCountryCode: '',
              e164Key: '',
            ),
          ),
        );

  void selectCountry(Country country) {
    emit(state.copyWith(selectedCountry: country));
  }
}
