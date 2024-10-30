import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'two_fa_authentication_state.dart';

class TwoFaAuthenticationCubit extends Cubit<TwoFaAuthenticationState> {
  TwoFaAuthenticationCubit() : super(const TwoFaAuthenticationState());

  void selectMethod(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
