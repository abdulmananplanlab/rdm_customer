import 'package:common/common.dart';
import 'package:common/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rdm_builder_customer/auth_cubit/auth_cubit.dart';
import 'package:rdm_builder_customer/forget_password/view/view.dart';
import 'package:rdm_builder_customer/widgets/custom_authenticator_code.dart';

class AuthenticationCodePage extends StatelessWidget {
  const AuthenticationCodePage({
    super.key,
    this.isForgetPassword = false,
  });
  final bool isForgetPassword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.authenticatorLoginDataSate !=
              current.authenticatorLoginDataSate,
      listenWhen: (previous, current) =>
          previous.authenticatorLoginDataSate !=
          current.authenticatorLoginDataSate,
      listener: (context, state) {
        if (state.authenticatorLoginDataSate.isFailure) {
          context.errorSnackbar(state.authenticatorLoginDataSate.errorMessage);
        } else if (state.authenticatorLoginDataSate.isLoaded) {
          final user = context.read<AuthCubit>().state.loginDataState.data;
          if (user != null && user.token != null) {
            context.read<AuthRepository>().updateUser(User.fromEntity(user));
          }
          showDialog<CustomAlertDialog>(
            context: context,
            builder: (context) => CustomAlertDialog(
              title: 'Account Verified!',
              subTitle: isForgetPassword == false
                  ? 'Let’s create a new secure  password for your account.'
                  : 'Welcome back to your realwealtdy dashboard.',
            ),
          );
          Future.delayed(const Duration(seconds: 4), () {
            if (!context.mounted) return;
            Navigator.pop(context);
            isForgetPassword == false
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordPage(),
                    ),
                  )
                : context.read<AuthRepository>().loginWithEmailPassword(
                      email: 'email',
                      password: 'password',
                    );
          });
        }
      },
      builder: (context, state) {
        return CustomAuthenticationCode(
          onChanged: isForgetPassword == false
              ? null
              : context.read<AuthCubit>().authenticationCodeLogin,
          loading: state.authenticatorLoginDataSate.isLoading,
          enabled: state.status.isValidated,
          onPressed: () {
            context.read<AuthCubit>().authenticationAppCodeLogin();
          },
        );
      },
    );
  }
}
