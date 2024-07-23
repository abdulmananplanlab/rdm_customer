import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: context.grey300,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'OR',
          style: context.twelve400.withColor(context.grey300),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Divider(
            color: context.grey300,
          ),
        ),
      ],
    );
  }
}
