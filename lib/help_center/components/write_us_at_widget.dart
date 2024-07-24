import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_color_container.dart';

class WriteUsAtWidget extends StatelessWidget {
  const WriteUsAtWidget({
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
            AssetIcons.email_icon,
            color: context.primary500,
          ),
        ),
        title: 'Write us at',
        subtitle: 'help@realwealtdy.com',
      ),
    );
  }
}
