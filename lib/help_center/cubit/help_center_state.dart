part of 'help_center_cubit.dart';

class HelpCenterState extends Equatable {
  const HelpCenterState({
    required this.helpCenterList,
  });
  final List<HelpCenterModel> helpCenterList;
  @override
  List<Object?> get props => [helpCenterList];

  HelpCenterState copyWith({
    bool? isExpanded,
    List<HelpCenterModel>? helpCenterList,
  }) {
    return HelpCenterState(
      helpCenterList: helpCenterList ?? this.helpCenterList,
    );
  }
}
