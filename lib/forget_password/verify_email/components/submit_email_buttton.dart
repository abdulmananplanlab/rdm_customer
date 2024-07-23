import 'package:common/theme/theme.dart';
import 'package:common/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/account_verification/account_verification.dart';
import 'package:rdm_builder_customer/forget_password/verify_email/cubit/verify_email_cubit.dart';

class SubmitEmailButton extends StatelessWidget {
  const SubmitEmailButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) {},
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return CustomElevatedButton(
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          width: double.infinity,
          text: 'Submit',
          enabled: state.status.isValid,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const AccountVerificationPage(
                  isForgotPassword: true,
                  isEmailAvailable: true,
                  isPasswordAvailable: true,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
