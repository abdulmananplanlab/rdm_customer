import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/components/bottom_details_widget.dart';
import 'package:rdm_builder_customer/home/components/horizontal_listing_widget.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/offer_price_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_dot_container.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';
import 'package:rdm_builder_customer/widgets/custom_icon_with_text_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';

import 'verified_rating_widget.dart';

class VerticalListingWidget extends StatelessWidget {
  const VerticalListingWidget({
    super.key,
    this.margin,
  });
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
      margin: margin,
      width: double.infinity,
      child: const Row(
        children: [
          ListingImageWidget(),
          ListingDetailWidget(),
        ],
      ),
    );
  }
}

class ListingDetailWidget extends StatelessWidget {
  const ListingDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const VerifiedRatingWidget(
              isVerticalListing: true,
            ),
            const SizedBox(height: 16),
            const BottomDetailsWidget(
              isVerticalListing: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ListingImageWidget extends StatelessWidget {
  const ListingImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
      ),
      child: Stack(
        children: [
          NetworkImageWidget(
            width: 120,
            height: MediaQuery.of(context).size.height * 0.34,
            imageUrl:
                'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          ),
          const CountPositionedImage(
            title: '1 / 20',
          ),
        ],
      ),
    );
  }
}

class CountPositionedImage extends StatelessWidget {
  const CountPositionedImage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4,
      left: 5,
      child: Row(children: [
        CustomColorContainer(
          borderRadius: BorderRadius.zero,
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(4),
          color: context.grey10.withOpacity(0.5),
          child: Text(
            title,
            style: context.ten400.withColor(context.white),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ]),
    );
  }
}
