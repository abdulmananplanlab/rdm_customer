import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomIconWithText extends StatelessWidget {
  const CustomIconWithText({
    super.key,
    required this.assetIcon,
    required this.text,
    this.iconSize = 18.0,
    this.style,
  });

  final AssetIcon assetIcon;
  final String text;
  final double iconSize;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: assetIcon,
        ),
        const SizedBox(width: 4.0),
        Text(text,
            style: style ?? context.twelve400.withColor(context.grey900)),
      ],
    );
  }
}
