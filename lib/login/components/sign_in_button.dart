import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/login/cubit/login_cubit.dart';
import 'package:rdm_builder_customer/two_fa-authentication/view/view.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.getUserLoginDataState != current.getUserLoginDataState,
          listener: (context, state) {
            if (state.getUserLoginDataState.isFailure) {
              context.errorSnackbar(state.getUserLoginDataState.errorMessage);
            } else if (state.getUserLoginDataState.isLoaded) {
              if (state.getUserLoginDataState.data?.isEmailVerified ?? false) {
                Future.delayed(
                  const Duration(seconds: 4),
                  () {
                    if (!context.mounted) return;
                    Navigator.pop(context); // Close the first dialog
                    _showVerificationCompleteDialog(context);
                  },
                );
              }
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.magicLinkSendLoginDataState !=
              current.magicLinkSendLoginDataState,
          listener: (context, state) {
            if (state.magicLinkSendLoginDataState.isFailure) {
              context.errorSnackbar(
                state.magicLinkSendLoginDataState.errorMessage,
              );
            } else if (state.magicLinkSendLoginDataState.isLoaded) {
              _showVerificationSentDialog(context);
            }
          },
        ),
      ],
      child: _SignInButtonView(),
    );
  }

  void _showVerificationSentDialog(BuildContext context) {
    showDialog<CustomAlertDialog>(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return LifecycleObserver(
          onInit: () {
            context.read<AuthCubit>().startTimer();
          },
          onResumed: () {
            $debugLog('resume');
            context.read<AuthCubit>().getUserBuilderLogin();
          },
          onPaused: () {
            $debugLog('pause');
          },
          onDisposed: () {
            context.read<AuthCubit>().cancelTimer();
          },
          child: const CustomAlertDialog(
            title: 'Verification Code Sent!',
            subTitle:
                'An email has been sent to your address with your verification OTP.',
          ),
        );
      },
    );
  }

  void _showVerificationCompleteDialog(BuildContext context) {
    showDialog<CustomAlertDialog>(
      barrierDismissible: false,
      context: context,
      builder: (context) => const CustomAlertDialog(
        title: 'Email Verification Complete!',
        subTitle: 'Just a few more steps left to complete your account signup.',
      ),
    );

    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (!context.mounted) return;
        Navigator.pop(context); // Close the second dialog
        Navigator.push(
          context,
          MaterialPageRoute<TwoFaAuthenticationPage>(
            builder: (context) => const TwoFaAuthenticationPage(
              // text: 'Secure My Account',
              isSupport: true,
            ),
          ),
        );
      },
    );
  }
}

class _SignInButtonView extends StatelessWidget {
  const _SignInButtonView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.loginDataState != current.loginDataState,
      builder: (context, state) {
        return CustomElevatedButton(
          loading: state.loginDataState.isLoading,
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          width: double.infinity,
          text: 'Sign In',
          enabled: state.status.isValidated,
          onPressed: () {
            context.unfocus();
            context.read<LoginCubit>().loginWithEmailPassword();
          },
        );
      },
    );
  }
}
