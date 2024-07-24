import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'help_center_state.dart';

class HelpCenterCubit extends Cubit<HelpCenterState> {
  HelpCenterCubit() : super(const HelpCenterState());

  void setIsExpanded() {
    emit(state.copyWith(isExpanded: !state.isExpanded));
  }
}
