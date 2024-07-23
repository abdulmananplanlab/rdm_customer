import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/account_verification/cubit/account_verification_cubit.dart';
import 'package:rdm_builder_customer/forget_password/forget_password.dart';
import 'package:rdm_builder_customer/widgets/custom_authenticator_code.dart';
import 'package:rdm_builder_customer/widgets/custom_pinput.dart';

class AccountVerificationButton extends StatelessWidget {
  const AccountVerificationButton({
    super.key,
    this.isEmailAvailable = false,
    this.isForgotPassword = false,
  });

  final bool isEmailAvailable;
  final bool isForgotPassword;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountVerificationCubit, AccountVerificationState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return CustomElevatedButton(
          width: double.infinity,
          text: state.selectedIndex == 0 ? 'Continue' : 'Verify',
          onPressed: state.selectedIndex == 0
              ? () {}
              : () {
                  if (state.selectedIndex == 1 || state.selectedIndex == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (_) => CustomPinPut(
                          onPressed: () {
                            showDialog<void>(
                              context: context,
                              builder: (context) => CustomAlertDialog(
                                title: 'Account Verified!',
                                subTitle: isEmailAvailable
                                    ? 'Let’s create a new secure  password for your account.'
                                    : 'Welcome back to your realwealtdy dashboard.',
                              ),
                            );
                            Future.delayed(
                              const Duration(seconds: 4),
                              () {
                                Navigator.pop(context);
                                isEmailAvailable
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute<ForgetPasswordPage>(
                                          builder: (context) {
                                            return const ForgetPasswordPage();
                                          },
                                        ),
                                      )
                                    : context
                                        .read<AuthRepository>()
                                        .loginWithEmailPassword(
                                          email: 'email',
                                          password: 'password',
                                        );
                              },
                            );
                          },
                          title: 'Enter Code',
                          appBarTitle: 'Account Verification',
                          subTitle: 'We have sent a verification code to',
                          isEmail: true,
                          colorTitle: state.selectedIndex == 1
                              ? '+1 234 567 890'
                              : 'realty@email.com',
                          isSupport: true,
                        ),
                      ),
                    );
                  }
                  if (state.selectedIndex == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<CustomAuthenticationCode>(
                        builder: (_) => CustomAuthenticationCode(
                          isForgetPassword: isForgotPassword,
                        ),
                      ),
                    );
                  }
                },
        );
      },
    );
  }
}
