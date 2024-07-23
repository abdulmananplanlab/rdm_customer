import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/forget_password/cubit/forget_password_cubit.dart';

class ConfirmPasswordFiled extends StatelessWidget {
  const ConfirmPasswordFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      buildWhen: (previous, current) =>
          previous.confirmPassword != current.confirmPassword ||
          previous.isConfirmPasswordVisible != current.isConfirmPasswordVisible,
      builder: (context, state) {
        return CustomTextFormField(
          obscureText: !state.isConfirmPasswordVisible,
          onChanged: context.read<ForgetPasswordCubit>().confirmPasswordChanged,
          hintText: '************',
          suffixIcon: InkWell(
            onTap: context
                .read<ForgetPasswordCubit>()
                .confirmPasswordVisibilityChanged,
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
