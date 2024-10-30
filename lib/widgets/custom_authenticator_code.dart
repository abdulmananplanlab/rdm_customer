import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rdm_builder_customer/widgets/rich_text_widgets.dart';
import 'package:rdm_builder_customer/widgets/text_with_text_field_widget.dart';

class CustomAuthenticationCode extends StatelessWidget {
  const CustomAuthenticationCode({
    this.isForgetPassword = false,
    this.onChanged,
    required this.onPressed,
    this.enabled = true,
    this.loading = false,
    super.key,
  });

  final bool isForgetPassword;
  final void Function(String)? onChanged;
  final VoidCallback onPressed;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Account Verification',
      ),
      backgroundColor: context.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Authentication Code',
              style: context.twenty600,
            ),
            const SizedBox(height: 8),
            Text(
              'Open your authenticator app to retrieve the code. The code changes every 30 seconds.',
              style: context.sixteen400,
            ),
            const SizedBox(height: 23),
            TextWithTextFieldWidget(
              //keyboardType: TextInputType.number,
              onChanged: onChanged,
              text: 'Authenticator App Code',
              hintText: '000-000',
            ),
            const Spacer(),
            CustomElevatedButton(
              borderColor: context.transparent,
              disabledBackgroundColor: context.grey300,
              disabledForegroundColor: context.white,
              width: double.infinity,
              text: 'Verify',
              onPressed: onPressed,
              enabled: enabled,
              loading: loading,
            ),
            const SizedBox(height: 16),
            Center(
              child: RichTextWidgets(
                colorTextStyle: context.twelve500.withColor(context.primary500),
                style: context.twelve400,
                colorTitle: 'Customer Support',
                simpleTitle: "Facing issues? We're here to assist. ",
                onTap: (context) {},
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CustomTextWithTextFieldWidget extends StatelessWidget {
  const CustomTextWithTextFieldWidget({
    super.key,
    this.text,
    required this.hintText,
    this.suffixIcon,
    this.onTap,
    this.hintTextStyle,
  });

  final String? text;
  final String hintText;
  final Widget? suffixIcon;
  final TextStyle? hintTextStyle;
  final void Function(BuildContext context)? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text ?? '',
          style: context.sixteen400,
        ),
        const SizedBox(height: 8),
        CustomTextFormField(
          onTap: () => onTap == null ? null : onTap!(context),
          hintText: hintText,
          hintTextStyle:
              hintTextStyle ?? context.sixteen400.withColor(context.grey900),
          readOnly: true,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: suffixIcon ?? const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
