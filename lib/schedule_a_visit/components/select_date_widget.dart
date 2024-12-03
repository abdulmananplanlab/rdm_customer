import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_drawer.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/text_with_text_field_widget.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class SelectDateWidget extends StatelessWidget {
  const SelectDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: NetworkImageWidget(
              height: 48,
              width: 48,
              imageUrl:
                  'https://images.unsplash.com/photo-1730460042828-89bc39c6d833?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ),
          VerticalSpacing(of: 8),
          CustomTitleSubtitle(
            crossAxisAlignment: CrossAxisAlignment.center,
            title: 'James Smith',
            titleStyle: context.sixteen600,
            subtitleStyle: context.twelve400.withColor(context.grey500),
            subtitle: '429 HERITAGE DR, FORT MURRAY AB T9K 1S4',
          ),
          VerticalSpacing(),
          TextWithTextFieldWidget(
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomIconButton(
                padding: EdgeInsets.only(top: 14, bottom: 14),
                icon: AssetIcon.monotone(AssetIcons.select_date_edit_icon),
                onPressed: () {},
              ),
            ),
            readOnly: true,
            hintText: 'Mon, Feb 17',
            hintStyle: context.sixteen500,
            text: 'Select Date',
            textStyle: context.sixteen600,
          ),
        ],
      ),
    );
  }
}
