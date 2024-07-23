import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/custom_title_subtitle.dart';
import 'package:rdm_builder_customer/widgets/rich_text_widgets.dart';

class CustomPassword extends StatelessWidget {
  const CustomPassword({
    super.key,
    required this.appBarTitle,
    required this.title,
    required this.subTitle,
    this.onChanged,
    required this.onPressed,
  });
  final String appBarTitle;
  final String title;
  final String subTitle;
  final void Function(String)? onChanged;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      appBar: CustomAppBar(
        title: appBarTitle,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitleSubtitle(
                      title: title,
                      subtitle: subTitle,
                    ),
                    const SizedBox(height: 16),
                    CustomTitleSubtitle(
                      title: 'Password',
                      isSubtitle: false,
                      titleStyle: context.sixteen400,
                    ),
                    CustomTextFormField(
                      onChanged: onChanged,
                      obscureText: true,
                      hintText: '************',
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: AssetIcon.monotone(
                          AssetIcons.password_eye,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomElevatedButton.expanded(
                  text: 'Confirm',
                  onPressed: onPressed,
                ),
                const SizedBox(height: 16),
                CustomOutlinedButton.custom(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: RichTextWidgets(
                    colorTextStyle:
                        context.twelve500.withColor(context.primary500),
                    style: context.twelve400,
                    colorTitle: 'Customer Support',
                    simpleTitle: "Facing issues? We're here to assist. ",
                    onTap: (context) {},
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
