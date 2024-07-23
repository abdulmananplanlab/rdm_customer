import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.child,
    this.crossAxisAlignment,
  });
  final bool value;
  final void Function(bool?) onChanged;
  final Widget? child;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      children: [
        Checkbox(
          side: BorderSide(
            color: context.grey300,
          ),
          activeColor: context.primary500,
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          value: value,
          onChanged: onChanged,
          // title:
        ),
        const SizedBox(width: 8),
        Expanded(
          child: child ??
              Text(
                'Remember me',
                style: context.fourteen400,
              ),
        ),
      ],
    );
  }
}
