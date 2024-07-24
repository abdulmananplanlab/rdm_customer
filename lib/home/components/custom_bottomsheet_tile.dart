import 'package:common/constants/asset_icons.dart';
import 'package:common/theme/theme.dart';
import 'package:common/widgets/asset_icon.dart';
import 'package:common/widgets/ink_well.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetTile extends StatelessWidget {
  const CustomBottomSheetTile({
    super.key,
    required this.title,
    this.isDivider = false,
    this.textStyle,
  });

  final String title;
  final bool? isDivider;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textStyle ?? context.twenty600,
              ),
              CustomInkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const AssetIcon.monotone(
                  AssetIcons.cross_mark,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        if (isDivider ?? true) const Divider() else const SizedBox.shrink(),
      ],
    );
  }
}
