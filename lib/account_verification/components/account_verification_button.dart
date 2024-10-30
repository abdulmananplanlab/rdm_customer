import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/forget_password/view/view.dart';
import 'package:rdm_builder_customer/widgets/custom_pinput.dart';

class PhoneNumberAccountVerification extends StatelessWidget {
  const PhoneNumberAccountVerification({
    super.key,
    required this.isEmailAvailable,
    required this.selectedIndexState,
  });

  final bool isEmailAvailable;
  final int selectedIndexState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.otpLoginVerifiedDataState !=
          current.otpLoginVerifiedDataState,
      listener: (context, state) {
        if (state.otpLoginVerifiedDataState.isFailure) {
          context.errorSnackbar(state.otpLoginVerifiedDataState.errorMessage);
        } else if (state.otpLoginVerifiedDataState.isLoaded) {
          final user = context.read<AuthCubit>().state.loginDataState.data;
          if (user != null && user.token != null) {
            context.read<AuthRepository>().updateUser(User.fromEntity(user));
          }
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
              if (!context.mounted) return;
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
                  : context.read<AuthRepository>().loginWithEmailPassword(
                        email: 'email',
                        password: 'password',
                      );
            },
          );
        }
      },
      child: _PhoneNumberAccountVerification(
        selectedIndexState: selectedIndexState,
      ),
    );
  }
}

class _PhoneNumberAccountVerification extends StatelessWidget {
  const _PhoneNumberAccountVerification({
    required this.selectedIndexState,
  });
  final int selectedIndexState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.otpLoginVerifiedDataState !=
              current.otpLoginVerifiedDataState,
      builder: (context, state) {
        return CustomPinPut(
          onChanged: context.read<AuthCubit>().otpPhoneNumberVerifiedLogin,
          enable: state.otpPhoneNumberVerifiedLogin.value.isNotEmpty,
          loading: state.otpLoginVerifiedDataState.isLoading,
          onPressed: () {
            context.unfocus();
            context.read<AuthCubit>().phoneNumberOtpVerifiedLogin();
          },
          title: 'Enter Code',
          appBarTitle: 'Account Verification',
          subTitle: 'We have sent a verification code to',
          isEmail: true,
          colorTitle: selectedIndexState == 2
              ? 'realty@email.com'
              : state.loginDataState.data?.phoneNo ?? 'No Phone Number',
          isSupport: true,
        );
      },
    );
  }
}
