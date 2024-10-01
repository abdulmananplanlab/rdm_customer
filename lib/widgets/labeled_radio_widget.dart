import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    this.label,
    required this.value,
    required this.onChanged,
  });

  final String? label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            onChanged(!value);
          },
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: value ? Colors.green : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: value ? Colors.green : Colors.grey.shade300,
                width: 1.5,
              ),
            ),
            child: Center(
              child: Container(
                height: 3,
                width: 3,
                decoration: BoxDecoration(
                  color: value ? Colors.white : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          label ?? '',
          style: context.sixteen400.withColor(context.grey900),
        ),
      ],
    );
  }
}
