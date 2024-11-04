import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomHorizontalTextRow extends StatelessWidget {
  const CustomHorizontalTextRow({
    super.key,
    this.leadingTitle,
    this.trailingTitle,
    this.leadingStyle,
    this.trailingStyle,
    this.trailingChild,
    this.leadingChild,
    this.mainAxisAlignment,
  });

  final String? leadingTitle;
  final String? trailingTitle;
  final TextStyle? leadingStyle;
  final TextStyle? trailingStyle;
  final Widget? trailingChild;
  final Widget? leadingChild;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        leadingChild ??
            Text(
              leadingTitle ?? '',
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
