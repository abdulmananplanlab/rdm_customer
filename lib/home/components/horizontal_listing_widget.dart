import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/components/listing_top_container.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_icon_with_text_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';

class HorizontalListingsWidget extends StatelessWidget {
  const HorizontalListingsWidget({
    super.key,
    this.margin,
  });
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
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
                const ListingPriceWidget(),
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

class BottomDetailsWidget extends StatelessWidget {
  const BottomDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomColorContainer(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIconWithText(
            assetIcon: AssetIcon.monotone(
              AssetIcons.bedroom_icon,
            ),
            text: '2',
          ),
          CustomIconWithText(
            assetIcon: AssetIcon.monotone(
              AssetIcons.bathroom_icon,
            ),
            text: '2',
          ),
          CustomIconWithText(
            assetIcon: AssetIcon.monotone(
              AssetIcons.pool_icon,
            ),
            text: '1',
          ),
          CustomIconWithText(
            assetIcon: AssetIcon.monotone(
              AssetIcons.square_feet,
            ),
            text: '6200 sq ft',
          ),
        ],
      ),
    );
  }
}

class VerifiedRatingWidget extends StatelessWidget {
  const VerifiedRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconWithText(
          assetIcon: const AssetIcon.multicolor(
            AssetIcons.star_icon,
            size: 14,
          ),
          text: '4.8',
          style: context.ten400.withColor(context.grey500),
        ),
        const SizedBox(
          width: 5,
        ),
        CustomIconWithText(
          assetIcon: const AssetIcon.multicolor(
            AssetIcons.verified_shield_icon,
            size: 14,
          ),
          text: 'Verified',
          style: context.ten400.withColor(context.grey500),
        ),
      ],
    );
  }
}
