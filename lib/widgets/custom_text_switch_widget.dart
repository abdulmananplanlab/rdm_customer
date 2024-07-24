import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TextSwitchWidget extends StatelessWidget {
  const TextSwitchWidget({
    super.key,
    this.isSwitch = false,
    this.isStyle = false,
    required this.title,
    this.padding,
    this.onChanged,
    this.value = false,
    this.style,
  });

  final bool isSwitch;
  final bool isStyle;
  final String title;
  final EdgeInsetsGeometry? padding;
  final void Function(bool)? onChanged;
  final bool value;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: style ?? (isStyle ? context.sixteen600 : context.sixteen400),
          ),
          if (isSwitch)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            )
          else
            Transform.scale(
              scaleX: 0.8,
              scaleY: 0.8,
              child: Switch(
                thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                  (Set<WidgetState> states) {
                    if (states.containsAll(
                      [WidgetState.disabled, WidgetState.selected],
                    )) {
                      return const Icon(Icons.circle, color: Colors.red);
                    }

                    if (states.contains(WidgetState.disabled)) {
                      return const Icon(Icons.circle, color: Colors.blue);
                    }

                    if (states.contains(WidgetState.selected)) {
                      return Icon(Icons.circle, color: context.white);
                    }

                    return Icon(Icons.circle, color: context.white);
                  },
                ),
                inactiveTrackColor: context.grey200,
                inactiveThumbColor: context.white,
                activeTrackColor: context.primary500,
                trackOutlineColor: WidgetStatePropertyAll(context.grey200),
                trackOutlineWidth: const WidgetStatePropertyAll(0.0),
                value: value,
                onChanged: onChanged,
              ),
            ),
        ],
      ),
    );
  }
}
