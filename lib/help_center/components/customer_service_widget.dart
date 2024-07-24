import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';

class CustomerServiceWidget extends StatelessWidget {
  const CustomerServiceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomColorContainer(
      margin: EdgeInsets.zero,
      child: CustomListTile(
        titleStyle: context.sixteen400.withColor(context.grey500),
        subtitleStyle: context.sixteen400,
        leading: CircleAvatar(
          backgroundColor: context.white,
          radius: 24,
          child: AssetIcon.monotone(
            AssetIcons.phone_icon,
            color: context.primary500,
          ),
        ),
        title: 'Our 24/7 customer service',
        subtitle: '+1 234 567 890',
      ),
    );
  }
}
