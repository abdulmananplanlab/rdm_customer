import 'package:common/constants/asset_icons.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/login/cubit/login_cubit.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.isVisible != current.isVisible,
      builder: (context, state) {
        return CustomTextFormField(
          onChanged: context.read<LoginCubit>().password,
          obscureText: !state.isVisible,
          hintText: '************',
          suffixIcon: InkWell(
            onTap: () {
              context.read<LoginCubit>().isVisible(!state.isVisible);
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
