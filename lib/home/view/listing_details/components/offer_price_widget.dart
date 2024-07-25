import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';

class OfferPriceAndIconWidget extends StatelessWidget {
  const OfferPriceAndIconWidget({
    super.key,
    required this.title,
    this.subtitle = '',
    this.subTitleColor,
    this.trailing,
    this.isTrailing = false,
    this.titleTextStyle,
    this.subTitleTextStyle,
  });
  final String title;
  final String subtitle;
  final Color? subTitleColor;
  final Widget? trailing;
  final bool? isTrailing;
  final TextStyle? titleTextStyle;
  final TextStyle? subTitleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: isTrailing == true
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isTrailing == true)
          Expanded(
            child: Text(
              title,
              style: titleTextStyle ?? context.sixteen400,
            ),
          )
        else
          Text(
            title,
            style: titleTextStyle ?? context.sixteen400,
          ),
        if (isTrailing == true)
          trailing ?? const SizedBox.shrink()
        else
          Text(
            subtitle,
            style: subTitleTextStyle ??
                context.sixteen600.withColor(subTitleColor ?? context.grey900),
          ),
      ],
    );
  }
}
