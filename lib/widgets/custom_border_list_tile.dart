import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';

class CustomBorderListTile extends StatelessWidget {
  const CustomBorderListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.dollarTitle,
    this.isAssetIcon = false,
    this.leading,
    this.isText = false,
    this.otherSubtitle,
  });
  final String title;
  final String? subtitle;
  final String? otherSubtitle;
  final String dollarTitle;
  final bool isAssetIcon;
  final bool isText;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
      width: 400,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomListTile(
            leading: isAssetIcon == true ? leading : const SizedBox.shrink(),
            crossAxisAlignment: CrossAxisAlignment.start,
            titleStyle: context.sixteen600,
            title: title,
            customSubtitle: isAssetIcon == false
                ? Text(
                    subtitle ?? '',
                    style: context.sixteen500.withColor(context.grey500),
                  )
                : const SizedBox.shrink(),
            trailing: Row(
              children: [
                if (isAssetIcon == false)
                  const AssetIcon.monotone(
                    AssetIcons.dollar_icon,
                    size: 24,
                  )
                else
                  SizedBox.fromSize(),
                const SizedBox(width: 4),
                Text(dollarTitle, style: context.sixteen500),
              ],
            ),
          ),
          if (isText == false)
            const SizedBox.shrink()
          else
            Text(
              otherSubtitle ?? '',
              style: context.sixteen500.withColor(context.grey500),
            ),
        ],
      ),
    );
  }
}
