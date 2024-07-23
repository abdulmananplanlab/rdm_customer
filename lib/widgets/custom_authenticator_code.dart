import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/forget_password/forget_password.dart';
import 'package:rdm_builder_customer/widgets/rich_text_widgets.dart';

class CustomAuthenticationCode extends StatelessWidget {
  const CustomAuthenticationCode({
    this.isForgetPassword = false,
    super.key,
  });

  final bool isForgetPassword;

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
            const CustomTextWithTextFieldWidget(
              text: 'Authenticator App Code',
              hintText: '000-000',
            ),
            const Spacer(),
            CustomElevatedButton(
              width: double.infinity,
              text: 'Verify',
              onPressed: () {
                showDialog<CustomAlertDialog>(
                  context: context,
                  builder: (context) => CustomAlertDialog(
                    title: 'Account Verified!',
                    subTitle: isForgetPassword
                        ? 'Let’s create a new secure  password for your account.'
                        : 'Welcome back to your realwealtdy dashboard.',
                  ),
                );

                Future.delayed(
                  const Duration(seconds: 4),
                  () {
                    Navigator.pop(context);
                    isForgetPassword
                        ? Navigator.push(
                            context,
                            MaterialPageRoute<ForgetPasswordPage>(
                              builder: (context) {
                                return const ForgetPasswordPage();
                              },
                            ),
                          )
                        : context.read<AuthRepository>().loginWithEmailPassword(
                              email: 'email',
                              password: 'password',
                            );
                  },
                );
              },
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
