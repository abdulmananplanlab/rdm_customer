import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/sign_up/cubit/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignUpCubit, SignUpState>(
          listenWhen: (previous, current) =>
              previous.signUpState != current.signUpState,
          listener: (context, state) {
            if (state.signUpState.isFailure) {
              context.errorSnackbar(state.signUpState.errorMessage);
            } else if (state.signUpState.isLoaded &&
                state.status.isSubmissionSuccess) {
              _showVerificationSentDialog(context);
              // final authCubit = context.read<AuthCubit>();
              // authCubit.magicLinkSend(
              //   email: state.email.value,
              //   // state.email.value
              // );
            }
          },
        ),
        // BlocListener<AuthCubit, AuthState>(
        //   listenWhen: (previous, current) =>
        //       previous.magicLinkSendDataState != current.magicLinkSendDataState,
        //   listener: (context, state) {
        //     if (state.magicLinkSendDataState.isFailure) {
        //       context.errorSnackbar(state.magicLinkSendDataState.errorMessage);
        //     } else if (state.magicLinkSendDataState.isLoaded) {
        //       _showVerificationSentDialog(context);
        //     }
        //   },
        // ),
      ],
      child: const _SignUpButtonView(),
    );
  }

  void _showVerificationSentDialog(BuildContext context) {
    showDialog<CustomAlertDialog>(
      context: context,
      builder: (context) {
        return LifecycleObserver(
          onResumed: () {
            $debugLog('resume');
          },
          onPaused: () {
            $debugLog('pause');
          },
          child: const CustomAlertDialog(
            title: 'Verification Code Sent!',
            subTitle:
                'An email has been sent to your address with your verification OTP.',
          ),
        );
      },
    );

    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (!context.mounted) return;
        Navigator.pop(context); // Close the first dialog
        _showVerificationCompleteDialog(context);
      },
    );
  }

  void _showVerificationCompleteDialog(BuildContext context) {
    showDialog<CustomAlertDialog>(
      context: context,
      builder: (context) => const CustomAlertDialog(
        title: 'Email Verification Complete!',
        subTitle: 'Just a few more steps left to complete your account signup.',
      ),
    );

    Future.delayed(
      const Duration(seconds: 4),
      () {
        // if (!context.mounted) return;
        // Navigator.pop(context); // Close the second dialog
        // Navigator.push(
        //   context,
        //   MaterialPageRoute<TwoFaAuthenticationPage>(
        //     builder: (context) => const TwoFaAuthenticationPage(
        //       text: 'Secure My Account',
        //       isSupport: true,
        //     ),
        //   ),
        // );
      },
    );
  }
}

class _SignUpButtonView extends StatelessWidget {
  const _SignUpButtonView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.signUpState != current.signUpState,
      builder: (_, state) {
        return CustomElevatedButton.expanded(
          loading: state.signUpState.isLoading,
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          text: 'Sign Up',
          enabled: state.status.isValidated,
          onPressed: () {
            context.unfocus();
            context.read<SignUpCubit>().signUpWithEmail();
          },
        );
      },
    );
  }
}
