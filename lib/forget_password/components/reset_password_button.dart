import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/forget_password/cubit/forget_password_cubit.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {},
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return CustomElevatedButton(
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          width: double.infinity,
          enabled: state.status.isValidated,
          text: 'Reset Password',
          onPressed: () {
            showDialog<CustomAlertDialog>(
              context: context,
              builder: (context) => const CustomAlertDialog(
                title: 'Password Changed!',
                subTitle:
                    'Your password successfully changed. Do not disclose your password to anyone.',
              ),
            );
            Future.delayed(const Duration(seconds: 4), () {
              Navigator.popUntil(
                context,
                (predicate) => predicate.isFirst,
              );
            });
          },
        );
      },
    );
  }
}
