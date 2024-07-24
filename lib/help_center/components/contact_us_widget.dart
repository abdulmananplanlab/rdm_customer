import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/help_center/components/customer_service_widget.dart';
import 'package:rdm_builder_customer/help_center/components/write_us_at_widget.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/vertical_spacing.dart';

class ContactUsWidget extends StatelessWidget {
  const ContactUsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleSubtitle(
            title: 'Contact Us',
            subtitle: 'Facing issues? We’re here to help',
          ),
          VerticalSpacing(of: 32),
          CustomerServiceWidget(),
          VerticalSpacing(),
          WriteUsAtWidget(),
        ],
      ),
    );
  }
}
