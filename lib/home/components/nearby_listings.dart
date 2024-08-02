import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/components/horizontal_listing_widget.dart';
import 'package:rdm_builder_customer/home/components/property_chips.dart';

class NearByListings extends StatelessWidget {
  const NearByListings({
    super.key,
    required this.propertyTypes,
  });

  final List<String> propertyTypes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PropertyChips(propertyTypes: propertyTypes),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Near Your Location",
            style: context.sixteen600.copyWith(color: context.grey900),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 357,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => const HorizontalListingsWidget(
                margin: EdgeInsets.only(right: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
