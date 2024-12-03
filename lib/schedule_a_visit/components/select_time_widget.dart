import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/view/home_filter/home_filter_view.dart';

class SelectTimeWidget extends StatelessWidget {
  const SelectTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> bathrooms = [
      '12:00 PM',
      '01:00 PM',
      '02:00 PM',
      '03:00 PM',
      '04:00 PM',
      '05:00 PM',
      '06:00 PM',
      '07:00 PM',
      '08:00 PM',
      '09:00 PM',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Time',
          style: context.sixteen600,
        ),
        const SizedBox(height: 16),
        ChipWidget(
          runSpacing: 3,
          spacing: 5.5,
          addedChips: bathrooms,
        ),
      ],
    );
  }
}
