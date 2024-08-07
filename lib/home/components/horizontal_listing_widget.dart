import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/components/bottom_details_widget.dart';
import 'package:rdm_builder_customer/home/components/listing_top_container.dart';
import 'package:rdm_builder_customer/home/components/verified_rating_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/offer_price_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/view/listing_page.dart';
import 'package:rdm_builder_customer/widgets/custom_dot_container.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';

class HorizontalListingsWidget extends StatelessWidget {
  const HorizontalListingsWidget({
    super.key,
    this.margin,
    this.listingIndex,
  });
  final EdgeInsetsGeometry? margin;
  final int? listingIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const PropertyDetailPage()));
      },
      child: CustomSideBorderWidget(
        margin: margin,
        padding: const EdgeInsets.only(
          bottom: 16,
        ),
        width: 300,
        child: Column(
          children: [
            const ListingTopContainer(),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: [
                  OfferPriceAndIconWidget(
                    titleTextStyle: context.eighteen600,
                    title: '\$3,125 - \$3,750/mo',
                    isTrailing: true,
                    trailing: Row(
                      children: [
                        const CustomDotContainer(),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "For Rent",
                          style: context.ten400.withColor(context.grey500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '429 HERITAGE DR, FORT MURRAY AB T9 1S4, New York',
                    style: context.sixteen600,
                  ),
                  const SizedBox(height: 16),
                  const VerifiedRatingWidget(),
                  const SizedBox(height: 16),
                  const BottomDetailsWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListingPriceWidget extends StatelessWidget {
  const ListingPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$3,125 - \$3,750/mo",
          style: context.eighteen600,
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 8,
              backgroundColor: context.grey50,
              child: Container(
                height: 10,
                width: 5,
                decoration: ShapeDecoration(
                  shape: const CircleBorder(),
                  color: context.success500,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text("For Rent"),
          ],
        ),
      ],
    );
  }
}
