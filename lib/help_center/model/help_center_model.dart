class HelpCenterModel {
  final String title;
  final String subTitle;
  bool isExpanded;

  HelpCenterModel({
    required this.title,
    required this.subTitle,
    required this.isExpanded,
  });

  HelpCenterModel copyWith({bool? isExpanded}) {
    return HelpCenterModel(
      title: title,
      subTitle: subTitle,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}
