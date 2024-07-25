import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:realwealtdy_builder/home/components/recent_offer_widgets.dart';
import 'package:realwealtdy_builder/widgets/custom_side_border_widget.dart';

class OfferDetailListWidget extends StatelessWidget {
  const OfferDetailListWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.isLeading = false,
    this.imageUrl,
    this.icon,
  });
  final String title;
  final String subtitle;
  final String? imageUrl;
  final bool? isLeading;
  final AssetIcons? icon;

  @override
  Widget build(BuildContext context) {
    return CustomSideBorderWidget(
      padding: const EdgeInsets.all(16),
      child: CustomListTile(
        height: 8,
        width: 8,
        leading: isLeading == true
            ? const SizedBox.shrink()
            : ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: NetworkImageWidget(
                  height: 48,
                  width: 48,
                  imageUrl: imageUrl ??
                      'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                ),
              ),
        customTitle: isLeading == true
            ? Row(
                children: [
                  AssetIcon.monotone(
                    icon ?? AssetIcons.dollar_icon,
                    color: context.grey500,
                  ),
                  Text(
                    title,
                    style: context.sixteen500.withColor(
                      context.grey500,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: context.sixteen500.withColor(
                  context.grey500,
                ),
              ),
        customSubtitle: isLeading == true
            ? Text(
                subtitle,
                style: context.twenty600,
              )
            : Row(
                children: [
                  Text(
                    subtitle,
                    style: context.twenty600,
                  ),
                  const SizedBox(width: 8),
                  AssetIcon.monotone(
                    AssetIcons.verified_circle,
                    color: context.primary500,
                  ),
                ],
              ),
      ),
    );
  }
}
