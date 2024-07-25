import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SellWidget extends StatelessWidget {
  const SellWidget({
    required this.title,
    required this.onTap,
    super.key,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            color: context.white,
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(title)),
    );
  }
}
