import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rdm_builder_customer/Identity_verification/Identity_verification/identity_verification.dart';
import 'package:rdm_builder_customer/widgets/rich_text_widgets.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
    required this.appBarTitle,
    required this.subTitle,
    this.isStepper = false,
    this.onPressed,
    this.isEmail = false,
    this.colorTitle,
    required this.title,
    this.isSupport = false,
    this.onChanged,
    this.loading = false,
    required this.enable,
  });

  final String appBarTitle;
  final String title;
  final String subTitle;
  final String? colorTitle;
  final bool isStepper;
  final bool isSupport;
  final bool isEmail;
  final bool loading;
  final bool enable;
  final VoidCallback? onPressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: MediaQuery.of(context).size.width,
      height: 92,
      textStyle: TextStyle(
        fontSize: 30,
        color: context.primary500,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: context.grey300),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: context.grey300),
      borderRadius: BorderRadius.circular(8),
    );

    return Scaffold(
      backgroundColor: context.white,
      appBar: CustomAppBar(
        title: appBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (isStepper)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          const CustomProgressBar(),
                          const SizedBox(height: 24),
                          Text(
                            'Step 1 of 5',
                            style: context.sixteen500
                                .withColor(context.primary500),
                          ),
                          const SizedBox(height: 8),
                        ],
                      )
                    else
                      const SizedBox.shrink(),
                    Text(
                      title,
                      style: context.twenty600,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subTitle,
                      style: context.sixteen400,
                    ),
                    if (isEmail)
                      Column(
                        children: [
                          Text(
                            colorTitle ?? 'realty@email.com',
                            style: context.sixteen500
                                .withColor(context.primary500),
                          ),
                          const SizedBox(height: 24),
                        ],
                      )
                    else
                      const SizedBox.shrink(),
                    Center(
                      child: Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        onChanged: onChanged,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Didn't receive the code?",
                          style: context.twelve400,
                        ),
                        CustomInkWell(
                          pressedOpacity: 0.4,
                          onTap: () {},
                          child: Text(
                            'Resend Code',
                            style:
                                context.twelve500.withColor(context.primary500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            CustomElevatedButton(
              loading: loading,
              enabled: enable,
              disabledBackgroundColor: context.grey300,
              disabledForegroundColor: context.white,
              width: double.infinity,
              text: 'Verify',
              onPressed: onPressed,
            ),
            const SizedBox(height: 16),
            if (isSupport)
              Center(
                child: RichTextWidgets(
                  colorTextStyle:
                      context.twelve500.withColor(context.primary500),
                  style: context.twelve400,
                  colorTitle: 'Customer Support',
                  simpleTitle: "Facing issues? We're here to assist. ",
                  onTap: (context) {},
                ),
              )
            else
              const SizedBox.shrink(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
