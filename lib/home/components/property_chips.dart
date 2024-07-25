import 'package:common/common.dart';
import 'package:flutter/material.dart';

class PropertyChips extends StatelessWidget {
  const PropertyChips({
    super.key,
    required this.propertyTypes,
  });

  final List<String> propertyTypes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Browse Properties',
          style: context.sixteen600.copyWith(color: context.grey900),
        ),
        const SizedBox(
          height: 16.0,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: propertyTypes
                    .map((title) => ChipWidget(
                          title: title,
                        ))
                    .toList()))
      ],
    );
  }
}

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: context.grey200)),
        child: Text(
          title,
          style: context.sixteen400.copyWith(color: context.grey900),
        ));
  }
}
