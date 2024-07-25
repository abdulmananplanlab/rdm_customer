import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_dot_text_widget.dart';

class OfferStorageWidgets extends StatelessWidget {
  const OfferStorageWidgets({
    super.key,
    required this.title,
    required this.subtitle,
    required this.title1,
    required this.subtitle1,
    required this.title2,
    required this.subtitle2,
  });
  final String title;
  final String subtitle;
  final String title1;
  final String subtitle1;
  final String title2;
  final String subtitle2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomDotTextWidget(
                title: title,
              ),
            ),
            Expanded(
              child: CustomDotTextWidget(
                title: subtitle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomDotTextWidget(
                title: title1,
              ),
            ),
            Expanded(
              child: CustomDotTextWidget(
                title: subtitle1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: CustomDotTextWidget(
                title: title2,
              ),
            ),
            Expanded(
              child: CustomDotTextWidget(
                title: subtitle2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
