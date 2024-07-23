import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ImageTextContainer extends StatelessWidget {
  const ImageTextContainer({
    super.key,
    required this.title,
    required this.assetIcons,
    this.padding,
  });

  final String title;
  final AssetIcons assetIcons;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: context.grey300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AssetIcon.monotone(
            assetIcons,
            size: 48,
          ),
          const SizedBox(height: 8),
          Text(
            textAlign: TextAlign.center,
            title,
            style: context.sixteen500,
          ),
        ],
      ),
    );
  }
}
