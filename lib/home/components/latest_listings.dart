import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rdm_builder_customer/home/components/vertical_listing_widget.dart';

class LatestListingWidget extends StatelessWidget {
  const LatestListingWidget({
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
          Text(
            "Latest Listings",
            style: context.sixteen600.copyWith(color: context.grey900),
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
              primary: true,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) => const VerticalListingWidget(
                      margin: EdgeInsets.only(
                    bottom: 16,
                  ))),
        ],
      ),
    );
  }
}
