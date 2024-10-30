import 'package:common/constants/asset_icons.dart';
import 'package:common/widgets/asset_icon.dart';
import 'package:common/widgets/text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/sign_up/cubit/sign_up_cubit.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.isVisible != current.isVisible,
      builder: (context, state) {
        return CustomTextFormField(
          textInputAction: TextInputAction.done,
          onChanged: context.read<SignUpCubit>().password,
          obscureText: !state.isVisible,
          hasError: state.password.invalid,
          hintText: '************',
          suffixIcon: InkWell(
            onTap: () {
              context.read<SignUpCubit>().isVisible(!state.isVisible);
            },
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
