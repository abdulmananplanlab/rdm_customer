import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_verification_state.dart';

class AccountVerificationCubit extends Cubit<AccountVerificationState> {
  AccountVerificationCubit()
      : super(const AccountVerificationState(selectedIndex: 0));

  void selectMethod(int index) {
    emit(AccountVerificationState(selectedIndex: index));
  }
}
