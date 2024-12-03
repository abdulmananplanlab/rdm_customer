import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/schedule_a_visit/components/components.dart';
import 'package:rdm_builder_customer/widgets/custom_authenticator_code.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/horizontal_spacing.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class ScheduleVisitBody extends StatelessWidget {
  const ScheduleVisitBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SelectDateWidget(),
          VerticalSpacing(of: 24),
          Divider(
            height: 0,
            color: context.grey300,
          ),
          VerticalSpacing(of: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SelectTimeWidget(),
              ],
            ),
          ),
          VerticalSpacing(of: 24),
          Divider(
            height: 0,
            color: context.grey300,
          ),
          VerticalSpacing(of: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitleSubtitle(
                  title: 'Enter Details',
                  titleStyle: context.sixteen600,
                  isSubtitle: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextWithTextFieldWidget(
                        hintText: 'ex. Emma',
                        text: 'First Name',
                      ),
                    ),
                    HorizontalSpacing(of: 16),
                    Expanded(
                      child: CustomTextWithTextFieldWidget(
                        hintText: 'ex. Wilson',
                        text: 'Last Name',
                      ),
                    ),
                  ],
                ),
                VerticalSpacing(of: 16),
                CustomTextWithTextFieldWidget(
                  hintText: 'ex. emma.wilson@email.com',
                  text: 'Email Address',
                ),
                VerticalSpacing(of: 16),
                CustomTextWithTextFieldWidget(
                  hintText: 'ex. (555) 123-4567',
                  text: 'Phone Number',
                ),
                VerticalSpacing(of: 16),
                CustomElevatedButton.expanded(
                  text: 'Schedule Appointment',
                  onPressed: () {},
                ),
                VerticalSpacing(of: 16),
                CustomOutlinedButton.custom(
                  text: 'Cancel',
                  onPressed: () {},
                ),
                VerticalSpacing(of: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
