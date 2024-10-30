import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TextWithTextFieldWidget extends StatelessWidget {
  const TextWithTextFieldWidget({
    super.key,
    this.text,
    required this.hintText,
    this.suffixIcon,
    this.textWidgetRequired = false,
    this.textSpan,
    this.textSpanColor,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.hintStyle,
    this.hasError = false,
    this.keyboardType,
  });
  final String? text;
  final String hintText;
  final String? textSpan;
  final String? textSpanColor;
  final Widget? suffixIcon;
  final bool textWidgetRequired;
  final bool readOnly;
  final int maxLines;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextStyle? hintStyle;
  final bool hasError;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (textWidgetRequired)
          Text.rich(
            TextSpan(
              style: context.sixteen400,
              text: textSpan ?? 'Tagline',
              children: [
                TextSpan(
                  style: context.sixteen400.withColor(context.grey300),
                  text: textSpanColor ?? ' (Optional)',
                ),
              ],
            ),
          )
        else
          Text(
            text ?? '',
            style: context.sixteen400,
          ),
        const SizedBox(height: 8),
        CustomTextFormField(
          hasError: hasError,
          keyboardType: keyboardType,
          onTap: onTap,
          onChanged: onChanged,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintTextStyle: hintStyle,
          readOnly: readOnly,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
