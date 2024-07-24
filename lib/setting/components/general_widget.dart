import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_text_button.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleSubtitle(
            titleStyle: context.sixteen600,
            title: 'General',
            subtitle:
                'Explore companies about and learn more about Realwealtdy’s policies,',
          ),
          const VerticalSpacing(of: 24),
          CustomTextButton(
            title: 'About',
            onPressed: () {},
          ),
          const VerticalSpacing(),
          CustomTextButton(
            title: 'Terms of Use',
            onPressed: () {},
          ),
          const VerticalSpacing(),
          CustomTextButton(
            title: 'Privacy Policy',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
