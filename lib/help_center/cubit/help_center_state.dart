part of 'help_center_cubit.dart';

class HelpCenterState extends Equatable {
  const HelpCenterState({
    this.isExpanded = false,
  });
  final bool isExpanded;
  @override
  List<Object?> get props => [isExpanded];

  HelpCenterState copyWith({
    bool? isExpanded,
  }) {
    return HelpCenterState(
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
