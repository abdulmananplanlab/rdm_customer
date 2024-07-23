import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/forget_password/verify_email/verify_email.dart';
import 'package:rdm_builder_customer/login/cubit/login_cubit.dart';
import 'package:rdm_builder_customer/widgets/custom_check_box.dart';

class CheckBoxForgetPasswordWidget extends StatelessWidget {
  const CheckBoxForgetPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: BlocBuilder<LoginCubit, LoginState>(
              buildWhen: (previous, current) =>
                  previous.isCheck != current.isCheck,
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    context.read<LoginCubit>().isCheck(!state.isCheck);
                  },
                  child: CustomCheckBox(
                    value: state.isCheck,
                    onChanged: context.read<LoginCubit>().isCheck,
                  ),
                );
              },
            ),
          ),
          Flexible(
            child: CustomInkWell(
              pressedOpacity: 0.4,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => const VerifyEmailPage(),
                  ),
                );
              },
              child: Text(
                'Forgot Password?',
                style: context.sixteen400.withColor(context.success500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
