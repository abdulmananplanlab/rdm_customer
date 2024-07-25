import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_border_list_tile.dart';

class TransitDataWidget extends StatelessWidget {
  const TransitDataWidget({
    super.key,
    required this.assetIcons,
    required this.title,
    required this.otherSubtitle,
    required this.dollarTitle,
  });

  final AssetIcons assetIcons;
  final String title;
  final String otherSubtitle;
  final String dollarTitle;

  @override
  Widget build(BuildContext context) {
    return CustomBorderListTile(
      isText: true,
      isAssetIcon: true,
      leading: const AssetIcon.monotone(AssetIcons.tabler_plane),
      otherSubtitle: otherSubtitle,
      title: title,
      dollarTitle: dollarTitle,
    );
  }
}
