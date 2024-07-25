import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/transit_data_widget.dart';

class TransitWidget extends StatelessWidget {
  const TransitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TransitDataWidget(
          assetIcons: AssetIcons.tabler_plane,
          title: 'JFK Airport',
          otherSubtitle: 'International Airport',
          dollarTitle: '0.5 miles',
        ),
        SizedBox(height: 16),
        TransitDataWidget(
          assetIcons: AssetIcons.underground_subway_icon,
          title: 'Western Avenue Station',
          otherSubtitle: 'Underground Subway',
          dollarTitle: '0.5 miles',
        ),
        SizedBox(height: 16),
        TransitDataWidget(
          assetIcons: AssetIcons.underground_subway_icon,
          title: '27th Street Station',
          otherSubtitle: 'Underground Subway',
          dollarTitle: '0.5 miles',
        ),
        SizedBox(height: 16),
        TransitDataWidget(
          assetIcons: AssetIcons.tabler_plane,
          title: 'JFK Airport',
          otherSubtitle: 'Chicago Midway International',
          dollarTitle: '0.5 miles',
        ),
      ],
    );
  }
}
