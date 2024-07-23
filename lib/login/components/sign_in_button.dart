import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/account_verification/account_verification.dart';
import 'package:rdm_builder_customer/login/cubit/login_cubit.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {},
      builder: (context, state) {
        return CustomElevatedButton(
          disabledBackgroundColor: context.grey300,
          disabledForegroundColor: context.white,
          width: double.infinity,
          text: 'Sign In',
          enabled: state.status.isValidated,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const AccountVerificationPage(),
              ),
            );
          },
        );
      },
    );
  }
}
