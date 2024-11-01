import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomHorizontalTextRow extends StatelessWidget {
  const CustomHorizontalTextRow({
    super.key,
    required this.leadingTitle,
    this.trailingTitle,
    this.leadingStyle,
    this.trailingStyle,
    this.trailingChild,
  });

  final String leadingTitle;
  final String? trailingTitle;
  final TextStyle? leadingStyle;
  final TextStyle? trailingStyle;
  final Widget? trailingChild;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leadingTitle,
          style: leadingStyle ?? context.sixteen400,
        ),
        trailingChild ??
            Text(
              overflow: TextOverflow.ellipsis,
              trailingTitle ?? '',
              style: trailingStyle ?? context.sixteen400,
            ),
      ],
    );
  }
}
