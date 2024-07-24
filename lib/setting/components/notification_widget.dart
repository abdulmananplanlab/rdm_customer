import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_text_switch_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomTitleSubtitle(
            titleStyle: context.sixteen600,
            title: 'Notifications',
            subtitle:
                'Get updates on new listings, messages and alerts on your submitted offers.',
          ),
          const VerticalSpacing(),
          TextSwitchWidget(
            value: false,
            onChanged: (value) {},
            padding: EdgeInsets.zero,
            title: 'Push Notifications',
            style: context.sixteen500,
          ),
          const VerticalSpacing(),
          TextSwitchWidget(
            value: false,
            onChanged: (value) {},
            padding: EdgeInsets.zero,
            title: 'Email Notifications',
            style: context.sixteen500,
          ),
          const VerticalSpacing(),
          TextSwitchWidget(
            value: false,
            onChanged: (value) {},
            padding: EdgeInsets.zero,
            title: 'Message Notifications',
            style: context.sixteen500,
          ),
        ],
      ),
    );
  }
}
