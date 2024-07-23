import 'package:bloc/bloc.dart';

part 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<int> {
  OnBoardingCubit() : super(0);

  void setPage(int index) {
    emit(index);
  }
}
