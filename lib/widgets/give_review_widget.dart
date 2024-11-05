import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rdm_builder_customer/widgets/custom_horizatal_text_row.dart';
import 'package:rdm_builder_customer/widgets/custom_text_button.dart';
import 'package:rdm_builder_customer/widgets/horizontal_spacing.dart';
import 'package:rdm_builder_customer/widgets/text_with_text_field_widget.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class GiveReviewWidget extends StatelessWidget {
  const GiveReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      crossAxisAlignment: CrossAxisAlignment.start,
      title: 'Review',
      titleStyle: context.sixteen400,
      trailing: CustomTextButton(
        title: 'Give a Review',
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
            ),
            backgroundColor: context.white,
            context: context,
            builder: (context) {
              return CustomBottomSheet(
                mainAxisSize: MainAxisSize.min,
                showDragHandle: false,
                content: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomHorizontalTextRow(
                        leadingTitle: 'Rate & Review',
                        leadingStyle: context.twenty600,
                        trailingChild: CustomIconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const VerticalSpacing(of: 16),
                      RatingBar(
                        itemSize: MediaQuery.of(context).size.height * 0.03,
                        initialRating: 0,
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
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        onRatingUpdate: (rating) {},
                      ),
                      const VerticalSpacing(of: 16),
                      TextWithTextFieldWidget(
                        maxLines: 3,
                        text: 'Write Review',
                        textStyle: context.sixteen600,
                        hintText: 'share details of your experience...',
                      ),
                      const VerticalSpacing(of: 16),
                      Row(
                        children: [
                          Expanded(
                            child: CustomOutlinedButton.custom(
                              height: 48,
                              text: 'Cancel',
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          HorizontalSpacing(of: 16),
                          Expanded(
                            child: CustomElevatedButton(
                              height: 48,
                              text: 'Submit',
                              onPressed: () {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
