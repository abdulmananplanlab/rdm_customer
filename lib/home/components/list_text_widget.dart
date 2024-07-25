import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ListTextWidget extends StatelessWidget {
  const ListTextWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.style,
    this.padding,
  });

  final String title;
  final VoidCallback onPressed;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Padding(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: style ?? context.sixteen400,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
