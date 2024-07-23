import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomSideBorderWidget extends StatelessWidget {
  const CustomSideBorderWidget({
    super.key,
    required this.child,
    this.padding,
  });
  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.grey200),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
