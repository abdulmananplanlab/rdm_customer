import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class LiveChatWidget extends StatelessWidget {
  const LiveChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const CustomTitleSubtitle(
            title: 'Can’t find the answer you’re looking for?',
            subtitle:
                'Chat with our customer support representative for further help.',
          ),
          const VerticalSpacing(),
          CustomOutlinedButton.expanded(
            textStyle: context.sixteen400,
            isSpacer: true,
            leading: AssetIcon.monotone(
              AssetIcons.message_icon,
              size: 24,
              color: context.primary500,
            ),
            borderColor: context.primary500,
            backgroundColor: context.white,
            foregroundColor: context.primary500,
            text: 'Live Chat',
            onPressed: () {},
          ),
          const VerticalSpacing(),
        ],
      ),
    );
  }
}
