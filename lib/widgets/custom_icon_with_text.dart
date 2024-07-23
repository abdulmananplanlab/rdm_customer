import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomIconWithText extends StatelessWidget {
  const CustomIconWithText({
    super.key,
    required this.assetIcon,
    required this.text,
    this.iconSize = 18.0,
    this.sizeBoxWidth = 8.0,
  });

  final AssetIcon assetIcon;
  final String text;
  final double iconSize;
  final double sizeBoxWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: assetIcon,
        ),
        SizedBox(width: sizeBoxWidth),
        Text(text, style: context.twelve400.withColor(context.grey900)),
      ],
    );
  }
}
