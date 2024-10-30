import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/account_verification/view/view.dart';
import 'package:rdm_builder_customer/login/cubit/login_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.loginDataState != current.loginDataState,
      listenWhen: (previous, current) =>
          previous.loginDataState != current.loginDataState,
      listener: (context, state) {
        if (state.loginDataState.isFailure) {
          context.errorSnackbar(state.loginDataState.errorMessage);
        } else if (state.loginDataState.isLoaded &&
            state.status.isSubmissionSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => const AccountVerificationPage(),
            ),
          );
        }
      },
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
