import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/two_factor_activition/cubits/two_factor_activition_cubit.dart';
import 'package:rdm_builder_customer/widgets/custom_pinput.dart';

class RegistrationOtp extends StatelessWidget {
  const RegistrationOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final code = context.select(
      (TwoFactorActivationCubit cubit) => cubit.state.selectedCountry,
    );
    final loading = context.select(
      (AuthCubit bloc) => bloc.state.getUserAuthenticatorDataState.isLoading,
    );
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.otpSignUpVerifiedDataState !=
              current.otpSignUpVerifiedDataState,
      builder: (context, state) {
        return CustomPinPut(
          loading: state.otpSignUpVerifiedDataState.isLoading || loading,
          enable: state.otpSignUpPhoneVerified.value.isNotEmpty,
          onChanged: context.read<AuthCubit>().otpPhoneNumberVerified,
          isEmail: true,
          title: 'Phone Number Verification',
          isStepper: true,
          colorTitle: '+${code.phoneCode}${state.otpPhoneNumberSignUp.value}',
          appBarTitle: '2FA Activation',
          subTitle: 'We have sent a verification code to ',
          onPressed: () {
            context.unfocus();
            context.read<AuthCubit>().phoneNumberOtpVerifiedSignUp();
          },
        );
      },
    );
  }
}
