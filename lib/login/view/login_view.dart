part of 'view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.noBar(),
      backgroundColor: context.white,
      body: MultiBlocListener(
        listeners: [
          BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                previous.loginDataState != current.loginDataState ||
                previous.socialLoginState != current.socialLoginState,
            listener: (context, state) {
              if (state.isLoginSuccessFull || state.isSocialLoginSuccessFull) {
                final user = User.fromEntity(state.user);
                if (user.isEmailVerified == false) {
                  context
                      .read<AuthCubit>()
                      .magicLinkSendLogin(email: state.email.value);
                } else {
                  if (user.isTwoFactorAuthenticatorComplete ||
                      user.isTwoFactorPhoneComplete) {
                    if (user.isTwoFactorPhoneComplete) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (_) => PhoneNumberAccountVerification(
                            selectedIndexState: 1,
                            isEmailAvailable: false,
                          ),
                        ),
                      );
                    } else if (user.isTwoFactorAuthenticatorComplete) {
                      Navigator.push(
                        context,
                        MaterialPageRoute<AuthenticationCodePage>(
                          builder: (_) => AuthenticationCodePage(
                            isForgetPassword: true,
                          ),
                        ),
                      );
                    }
                  } else {
                    context.read<AuthRepository>().updateUser(user);
                  }
                }
              } else if (state.loginDataState.isFailure) {
                context.errorSnackbar(state.loginDataState.errorMessage);
              } else if (state.socialLoginState.isFailure) {
                context.errorSnackbar(state.socialLoginState.errorMessage);
              }
            },
          ),
        ],
        child: _BodyView(),
      ),
    );
  }
}

class _BodyView extends StatelessWidget {
  const _BodyView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AssetIcon.multicolor(
                AssetIcons.app_logo,
                size: 34,
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EmailTextField(),
                  const SizedBox(height: 16),
                  Text(
                    'Password',
                    style: context.fourteen400,
                  ),
                  const SizedBox(height: 8),
                  const PasswordTextField(),
                  const SizedBox(height: 10),
                  const CheckBoxForgetPasswordWidget(),
                  const SizedBox(height: 10),
                  const SignInButton(),
                  const SizedBox(height: 16),
                  const OrWidget(),
                  const SizedBox(height: 16),
                  const _ContinueWithGoogle(),
                  const SizedBox(height: 16),
                  _ContinueWithFacebook(),
                  const SizedBox(height: 16),
                  if (Platform.isIOS)
                    CustomOutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<AccountVerificationPage>(
                            builder: (_) => const AccountVerificationPage(),
                          ),
                        );
                      },
                      borderRadius: 4.0,
                      width: double.infinity,
                      leading:
                          const AssetIcon.multicolor(AssetIcons.apple_icon),
                      text: 'Continue with Apple',
                    ),
                  const SizedBox(height: 16),
                  Center(
                    child: RichTextWidgets(
                      colorTitle: ' Sign Up',
                      simpleTitle: "Don't have an account? ",
                      onTap: (BuildContext context) {
                        context.push(SignUpPage.route());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContinueWithGoogle extends StatelessWidget {
  const _ContinueWithGoogle();

  @override
  Widget build(BuildContext context) {
    final socialLoginState = context.select(
      (LoginCubit cubit) => cubit.state.socialLoginState,
    );
    return CustomOutlinedButton(
      onPressed: context.read<LoginCubit>().loginWithGoogle,
      loading: socialLoginState.key == 'google' && socialLoginState.isLoading,
      enabled: socialLoginState.isInitial || socialLoginState.isFailure,
      borderRadius: 4.0,
      width: double.infinity,
      leading: const AssetIcon.multicolor(AssetIcons.google_icon),
      text: 'Continue with Google',
    );
  }
}

class _ContinueWithFacebook extends StatelessWidget {
  const _ContinueWithFacebook();

  @override
  Widget build(BuildContext context) {
    final socialLoginState = context.select(
      (LoginCubit cubit) => cubit.state.socialLoginState,
    );
    return CustomOutlinedButton(
      onPressed: context.read<LoginCubit>().loginWithFacebook,
      loading: socialLoginState.key == 'facebook' && socialLoginState.isLoading,
      enabled: socialLoginState.isInitial || socialLoginState.isFailure,
      borderRadius: 4.0,
      width: double.infinity,
      leading: const AssetIcon.multicolor(AssetIcons.facebook_icon),
      text: 'Continue with Facebook',
    );
  }
}
