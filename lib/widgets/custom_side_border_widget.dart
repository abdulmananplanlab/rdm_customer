import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSideBorderWidget extends StatelessWidget {
  const CustomSideBorderWidget({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.margin,
    this.radius,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      margin: margin,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? context.grey200),
          borderRadius: radius ?? BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
