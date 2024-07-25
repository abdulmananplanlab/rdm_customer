import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';

class ListingTopContainer extends StatelessWidget {
  const ListingTopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
      child: Stack(
        children: [
          const NetworkImageWidget(
            imageUrl:
                'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          ),
          Positioned(
            top: 8,
            right: 10,
            child: Row(children: [
              CustomIconWidget(
                onTap: () {},
                assetIcon: const AssetIcon.multicolor(
                    AssetIcons.grey_share_icon,
                    size: 16),
              ),
              const SizedBox(
                width: 8,
              ),
              CustomIconWidget(
                onTap: () {},
                assetIcon: const AssetIcon.multicolor(
                  AssetIcons.heart_icon,
                  size: 16,
                ),
              ),
            ]),
          ),
          Positioned(
            bottom: 4,
            right: 5,
            child: Row(children: [
              CustomColorContainer(
                borderRadius: BorderRadius.zero,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(4),
                color: context.grey10.withOpacity(0.5),
                child: Text(
                  '1 / 20',
                  style: context.ten400.withColor(context.white),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({
    super.key,
    required this.assetIcon,
    required this.onTap,
    this.borderRadius,
    this.padding,
    this.color,
  });
  final AssetIcon assetIcon;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(33),
            color: color ?? context.white),
        padding: const EdgeInsets.all(6.0),
        child: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: assetIcon,
            )));
  }
}
