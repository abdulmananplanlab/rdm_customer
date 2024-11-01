import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';

class HomeProfileListTileWidget extends StatelessWidget {
  const HomeProfileListTileWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    this.isVerified = false,
    this.color,
  });
  final String imageUrl;
  final String title;
  final String subTitle;
  final bool isVerified;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomColorContainer(
      color: color ?? context.grey50,
      margin: const EdgeInsets.only(top: 16),
      child: CustomListTile(
        titleStyle: context.sixteen400.withColor(context.grey500),
        subtitleStyle: context.sixteen400,
        leading: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
              child: NetworkImageWidget(
                height: 50,
                width: 50,
                imageUrl: imageUrl,
              ),
            ),
            if (isVerified)
              const Positioned(
                left: 27.0,
                bottom: 0.0,
                child: AssetIcon.multicolor(AssetIcons.verified_circle),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
        title: title,
        subtitle: subTitle,
        trailing: const Row(
          children: [
            AssetIcon.monotone(AssetIcons.message_icon),
            SizedBox(width: 16),
            AssetIcon.monotone(AssetIcons.phone_icon),
          ],
        ),
      ),
    );
  }
}
