import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/sign_up/cubit/sign_up_cubit.dart';
import 'package:rdm_builder_customer/sign_up/sign_up.dart';
import 'package:rdm_builder_customer/two_factor_activition/two_fa_authentication.dart';
import 'package:rdm_builder_customer/widgets/custom_pinput.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isValidated) {}
      },
      builder: (context, state) {
        return CustomElevatedButton.expanded(
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          text: 'Sign Up',
          enabled: state.status.isValid,
          onPressed: () {
            showDialog<CustomAlertDialog>(
              context: context,
              builder: (context) => const CustomAlertDialog(
                title: 'Verification Code Sent!',
                subTitle:
                    'An email has been sent to your address with your verification OTP.',
              ),
            );

            Future.delayed(
              const Duration(seconds: 4),
              () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute<SignUpPage>(
                    builder: (context) => CustomPinPut(
                      isSupport: true,
                      title: 'Enter Code',
                      isEmail: true,
                      onPressed: () {
                        showDialog<CustomAlertDialog>(
                          context: context,
                          builder: (context) => const CustomAlertDialog(
                            title: 'Email Verification Complete!',
                            subTitle:
                                'Just a few more steps left to complete your account signup.',
                          ),
                        );
                        Future.delayed(
                          const Duration(seconds: 4),
                          () {
                            context.unfocus();
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute<TwoFaAuthentication>(
                                builder: (context) => const TwoFaAuthentication(
                                  text: 'Secure My Account',
                                  isSupport: true,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      appBarTitle: 'Email Verification',
                      subTitle: 'We have sent a verification code to',
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
