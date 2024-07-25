import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_icon_with_text_widget.dart';

class VerifiedRatingWidget extends StatelessWidget {
  const VerifiedRatingWidget({
    super.key,
    this.isVerticalListing = false,
  });
  final bool isVerticalListing;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
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
            width: 8,
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
      ),
      isVerticalListing
          ? const Row(
              children: [
                AssetIcon.multicolor(
                  AssetIcons.grey_share_icon,
                  size: 14,
                ),
                SizedBox(
                  width: 8,
                ),
                AssetIcon.multicolor(
                  AssetIcons.heart_icon,
                  size: 14,
                ),
              ],
            )
          : const SizedBox.shrink(),
    ]);
  }
}
