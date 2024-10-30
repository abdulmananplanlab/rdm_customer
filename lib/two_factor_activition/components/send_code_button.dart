import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/home/view/home/view.dart';
import 'package:rdm_builder_customer/two_factor_activition/components/registration_otp.dart';
import 'package:rdm_builder_customer/two_factor_activition/cubits/two_factor_activition_cubit.dart';

class SendCodeButton extends StatelessWidget {
  const SendCodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.phoneNumberSignUpDataSate !=
              current.phoneNumberSignUpDataSate,
          listener: (context, state) {
            if (state.phoneNumberSignUpDataSate.isFailure) {
              context
                  .errorSnackbar(state.phoneNumberSignUpDataSate.errorMessage);
            } else if (state.phoneNumberSignUpDataSate.isLoaded &&
                state.status.isSubmissionSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute<RegistrationOtp>(
                  builder: (_) => BlocProvider.value(
                    value: context.read<TwoFactorActivationCubit>(),
                    child: RegistrationOtp(),
                  ),
                ),
              );
            }
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              previous.otpSignUpVerifiedDataState !=
              current.otpSignUpVerifiedDataState,
          listener: (context, state) {
            if (state.otpSignUpVerifiedDataState.isFailure) {
              context
                  .errorSnackbar(state.otpSignUpVerifiedDataState.errorMessage);
            } else if (state.otpSignUpVerifiedDataState.isLoaded) {
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
              if (data != null && data.token != null) {
                context.read<AuthRepository>().updateBuilderUser(
                      User.fromEntity(data),
                    );
              }
              final code = context
                  .read<TwoFactorActivationCubit>()
                  .state
                  .selectedCountry;
              final authState =
                  context.read<AuthCubit>().state.otpPhoneNumberSignUp;

              showDialog<CustomAlertDialog>(
                context: context,
                builder: (context) {
                  return CustomAlertDialog(
                    title: '2F Authentication Activated!',
                    subTitle:
                        'You’ll be receiving verification codes to +${code.phoneCode}${authState.value}',
                  );
                },
              );
              Future.delayed(
                const Duration(seconds: 4),
                () {
                  if (!context.mounted) return;
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute<HomePage>(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              );
            }
          },
        ),
      ],
      child: _SendCodeButtonView(),
    );
  }
}

class _SendCodeButtonView extends StatelessWidget {
  const _SendCodeButtonView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.phoneNumberSignUpDataSate !=
              current.phoneNumberSignUpDataSate,
      builder: (context, state) {
        return CustomElevatedButton.expanded(
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          loading: state.phoneNumberSignUpDataSate.isLoading,
          enabled: state.status.isValidated,
          text: 'Send Code',
          onPressed: () {
            context.unfocus();
            context.read<AuthCubit>().signUpPhoneNumberAuthentication();
          },
        );
      },
    );
  }
}
