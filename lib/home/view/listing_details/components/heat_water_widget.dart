import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/image_text_container.dart';

class HeatWaterWidget extends StatelessWidget {
  const HeatWaterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: ImageTextContainer(
            padding: EdgeInsets.symmetric(
              vertical: 24,
            ),
            title: 'Heat',
            assetIcons: AssetIcons.heat_icon,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: ImageTextContainer(
            padding: EdgeInsets.symmetric(
              vertical: 24,
            ),
            title: 'Water',
            assetIcons: AssetIcons.water_icon,
          ),
        ),
      ],
    );
  }
}
