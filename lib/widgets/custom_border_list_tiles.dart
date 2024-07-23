import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomBorderListTiles extends StatelessWidget {
  const CustomBorderListTiles({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
    required this.isColor,
  });

  final String title;
  final String subTitle;
  final AssetIcons icon;
  final void Function(BuildContext context) onTap;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isColor ? context.primary500 : context.grey300,
          ),
        ),
        child: ListTile(
          isThreeLine: true,
          minVerticalPadding: 0,
          minLeadingWidth: 16,
          contentPadding: EdgeInsets.zero,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -2),
          dense: true,
          leading: AssetIcon.multicolor(
            icon,
            size: 32,
          ),
          title: Text(
            title,
            style: context.sixteen600,
          ),
          subtitle: Text(
            subTitle,
            style: context.sixteen400,
          ),
        ),
      ),
    );
  }
}
