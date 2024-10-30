import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/home/view/home/view.dart';
import 'package:rdm_builder_customer/two_fa_authentication_app/cubit/two_fa_authentication_app_cubit.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<TwoFaAuthenticationAppCubit, TwoFaAuthenticationAppState>(
          listenWhen: (previous, current) =>
              previous.dataState != current.dataState,
          listener: (context, state) {
            if (state.dataState.isFailure) {
              context.errorSnackbar(state.dataState.errorMessage);
            } else if (state.dataState.isLoaded) {
              context.read<AuthCubit>().getUserBuilderAuthenticator();
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.getUserAuthenticatorDataState !=
              current.getUserAuthenticatorDataState,
          listener: (context, state) {
            if (state.getUserAuthenticatorDataState.isFailure) {
              context.errorSnackbar(
                state.getUserAuthenticatorDataState.errorMessage,
              );
            }
            if (state.getUserAuthenticatorDataState.isLoaded) {
              final data = state.getUserAuthenticatorDataState.data;
              $debugLog(data?.qrCodeSecret);
              if (data != null && data.token != null) {
                context.read<AuthRepository>().updateBuilderUser(
                      User.fromEntity(data),
                    );
                showDialog<CustomAlertDialog>(
                  context: context,
                  builder: (context) => const CustomAlertDialog(
                    title: '2F Authentication Activated!',
                    subTitle:
                        'Your setup is complete. Use your Google Authenticator app to generate OTP.',
                  ),
                );
                Future.delayed(
                  const Duration(seconds: 4),
                  () {
                    if (!context.mounted) return;
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute<HomePage>(
                        builder: (_) => const HomePage(),
                      ),
                    );
                  },
                );
              }
            }
          },
        ),
      ],
      child: _VerifyButtonView(),
    );
  }
}

class _VerifyButtonView extends StatelessWidget {
  const _VerifyButtonView();

  @override
  Widget build(BuildContext context) {
    final loading = context.select(
      (AuthCubit bloc) => bloc.state.getUserAuthenticatorDataState.isLoading,
    );
    return BlocBuilder<TwoFaAuthenticationAppCubit,
        TwoFaAuthenticationAppState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.dataState != current.dataState,
      builder: (context, state) {
        return CustomElevatedButton.expanded(
          loading: state.dataState.isLoading || loading,
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          enabled: state.status.isValidated,
          text: 'Verify',
          onPressed: () {
            context.unfocus();
            context.read<TwoFaAuthenticationAppCubit>().authenticatorAppCode();
          },
        );
      },
    );
  }
}
