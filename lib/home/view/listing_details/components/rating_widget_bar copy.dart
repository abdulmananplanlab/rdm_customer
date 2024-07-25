import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidgetBar extends StatelessWidget {
  const RatingWidgetBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
          itemSize: MediaQuery.of(context).size.height * 0.04,
          initialRating: 3,
          allowHalfRating: true,
          maxRating: 5.0,
          ratingWidget: RatingWidget(
            full: AssetIcon.monotone(
              AssetIcons.star_icon,
              color: context.yellow,
            ),
            half: AssetIcon.monotone(
              AssetIcons.star_icon,
              color: context.yellow.withOpacity(0.5),
            ),
            empty: AssetIcon.monotone(
              AssetIcons.star_icon,
              color: context.grey300,
            ),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
          onRatingUpdate: (rating) {},
        ),
        const SizedBox(width: 8),
        Text(
          '3.5',
          style: context.sixteen400,
        ),
        const SizedBox(width: 8),
        Text(
          '(256)',
          style: context.sixteen400.withColor(context.grey500),
        ),
      ],
    );
  }
}
