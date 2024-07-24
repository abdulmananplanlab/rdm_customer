import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    this.textStyle,
    required this.title,
    required this.onPressed,
    this.foregroundColor,
    this.padding,
  });

  final TextStyle? textStyle;
  final String title;
  final VoidCallback onPressed;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        // overlayColor: Colors.transparent,
        padding: padding ?? EdgeInsets.zero,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        foregroundColor: foregroundColor ?? context.primary500,
        textStyle: textStyle ?? context.sixteen500,
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
