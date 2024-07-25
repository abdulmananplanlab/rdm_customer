import 'package:common/constants/asset_icons.dart';
import 'package:common/widgets/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_icon_with_text_widget.dart';

class BottomDetailsWidget extends StatelessWidget {
  const BottomDetailsWidget({
    super.key,
    this.isVerticalListing = false,
  });

  final bool isVerticalListing;

  @override
  Widget build(BuildContext context) {
    return CustomColorContainer(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CustomIconWithText(
            assetIcon: AssetIcon.monotone(
              AssetIcons.bedroom_icon,
            ),
            text: '2',
          ),
          const CustomIconWithText(
            assetIcon: AssetIcon.monotone(
              AssetIcons.bathroom_icon,
            ),
            text: '2',
          ),
          isVerticalListing
              ? const SizedBox.shrink()
              : const CustomIconWithText(
                  assetIcon: AssetIcon.monotone(
                    AssetIcons.pool_icon,
                  ),
                  text: '1',
                ),
          const CustomIconWithText(
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
