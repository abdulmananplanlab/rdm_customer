import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/forget_password/cubit/forget_password_cubit.dart';

class NewPasswordField extends StatelessWidget {
  const NewPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (previous, current) =>
          previous.newPassword != current.newPassword ||
          previous.isNewPasswordVisible != current.isNewPasswordVisible,
      builder: (context, state) {
        return CustomTextFormField(
          obscureText: !state.isNewPasswordVisible,
          onChanged: context.read<ForgetPasswordCubit>().newPasswordChanged,
          hintText: '************',
          suffixIcon: InkWell(
            onTap: context
                .read<ForgetPasswordCubit>()
                .newPasswordVisibilityChanged,
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: AssetIcon.monotone(
                AssetIcons.password_visibility,
                size: 12,
              ),
            ),
          ),
        );
      },
    );
  }
}
