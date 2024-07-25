import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomIconTextWidget extends StatelessWidget {
  const CustomIconTextWidget({
    super.key,
    required this.title,
    required this.icons,
    this.isTrailing = false,
    this.color,
  });
  final String title;
  final AssetIcons icons;
  final bool isTrailing;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (isTrailing == true)
          const SizedBox.shrink()
        else
          AssetIcon.monotone(
            icons,
            color: context.grey500,
          ),
        const SizedBox(width: 8),
        Text(
          title,
          style: context.sixteen500.withColor(color ?? context.grey900),
        ),
        const SizedBox(width: 6),
        if (isTrailing == false)
          const SizedBox.shrink()
        else
          AssetIcon.monotone(
            icons,
            size: 8,
            color: context.primary500,
          ),
      ],
    );
  }
}
