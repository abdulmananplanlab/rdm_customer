import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomDotTextWidget extends StatelessWidget {
  const CustomDotTextWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 8,
          width: 8,
          decoration: ShapeDecoration(
            color: context.grey900,
            shape: CircleBorder(
              side: BorderSide(
                color: context.grey900,
              ),
            ),
          ),
        ),
        const SizedBox(width: 11),
        Text(
          title,
          style: context.sixteen500,
        ),
      ],
    );
  }
}
