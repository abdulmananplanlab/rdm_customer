import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/home/view/listing_details/components/custom_icon_text_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_side_border_widget.dart';

class UnitPricingWidget extends StatelessWidget {
  const UnitPricingWidget({
    super.key,
    required this.title,
    required this.photos,
    required this.virtualTours,
    required this.video,
    required this.dollar,
    required this.bedroom,
    required this.bathroom,
    required this.area,
  });

  final String title;
  final String photos;
  final String virtualTours;
  final String video;
  final String dollar;
  final String bedroom;
  final String bathroom;
  final String area;

  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.sixteen600,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIconTextWidget(
                title: photos,
                icons: AssetIcons.photos,
              ),
              Text(
                '-',
                style: context.sixteen500,
              ),
              CustomIconTextWidget(
                title: virtualTours,
                icons: AssetIcons.video,
              ),
              Text(
                '-',
                style: context.sixteen500,
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomIconTextWidget(
            title: video,
            icons: AssetIcons.virtual_tour,
          ),
          const SizedBox(height: 16),
          Divider(
            color: context.grey200,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIconTextWidget(
                title: dollar,
                icons: AssetIcons.dollar_icon,
              ),
              Text(
                '-',
                style: context.sixteen500,
              ),
              CustomIconTextWidget(
                title: bedroom,
                icons: AssetIcons.bedroom_icon,
              ),
              const SizedBox(width: 10),
              Text(
                '-',
                style: context.sixteen500,
              ),
              const SizedBox(width: 10),
              CustomIconTextWidget(
                title: bathroom,
                icons: AssetIcons.bathroom_icon,
              ),
              const SizedBox(width: 10),
              Text(
                '-',
                style: context.sixteen500,
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomIconTextWidget(
            title: area,
            icons: AssetIcons.area_icon,
          ),
          const SizedBox(height: 16),
          CustomIconTextWidget(
            isTrailing: true,
            color: context.primary500,
            title: 'Show Amenities',
            icons: AssetIcons.down_arrow,
          ),
        ],
      ),
    );
  }
}
