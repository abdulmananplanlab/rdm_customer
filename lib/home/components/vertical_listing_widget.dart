import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';
import 'package:rdm_builder_customer/widgets/custom_icon_with_text_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';

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

class ListingPriceWidget extends StatelessWidget {
  const ListingPriceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "\$3,125 - \$3,750/mo",
            style: context.eighteen600,
          ),
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
    this.isVertical = false,
  });

  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
      isVertical
          ? Row(
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
            )
          : const SizedBox.shrink()
    ]);
  }
}
