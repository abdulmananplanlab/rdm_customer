part of 'view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      body: SafeArea(
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
                    const FirstNameField(),
                    const SizedBox(height: 16),
                    const LastNameField(),
                    const SizedBox(height: 16),
                    const EmailField(),
                    const SizedBox(height: 16),
                    Text(
                      'Password',
                      style: context.fourteen400,
                    ),
                    const SizedBox(height: 8),
                    const PasswordField(),
                    const SizedBox(height: 40),
                    const SignUpButton(),
                    const SizedBox(height: 16),
                    const OrWidget(),
                    const SizedBox(height: 16),
                    const _SocialSignUpListner(),
                    _ContinueWithGoogle(),
                    const SizedBox(height: 16),
                    _ContinueWithFacebook(),
                    const SizedBox(height: 16),
                    if (Platform.isIOS)
                      CustomOutlinedButton(
                        onPressed: () {},
                        borderRadius: 4.0,
                        width: double.infinity,
                        leading:
                            const AssetIcon.multicolor(AssetIcons.apple_icon),
                        text: 'Continue with Apple',
                      ),
                    const SizedBox(height: 16),
                    Center(
                      child: RichTextWidgets(
                        colorTitle: ' Sign In',
                        simpleTitle: 'Already have an account?',
                        onTap: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute<LoginPage>(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 38),
                    InkWell(
                      onTap: () {
                        context.push(LoginPage.route());
                      },
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'By using our app, you agree to our  ',
                                style: context.twelve400
                                    .withColor(context.grey300),
                              ),
                              TextSpan(
                                text: 'Privacy Policy\n',
                                style: context.twelve500,
                              ),
                              TextSpan(
                                text: 'and',
                                style: context.twelve400
                                    .withColor(context.grey300),
                              ),
                              TextSpan(
                                text: ' Terms and Condition',
                                style: context.twelve500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialSignUpListner extends StatelessWidget {
  const _SocialSignUpListner();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          previous.socialSignUpDataState != current.socialSignUpDataState,
      listener: (context, state) {
        if (state.socialSignUpDataState.isLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute<TwoFaAuthenticationPage>(
              builder: (context) => const TwoFaAuthenticationPage(
                isSupport: true,
              ),
            ),
          );
        }
        if (state.socialSignUpDataState.isFailure) {
          context.errorSnackbar(state.socialSignUpDataState.errorMessage);
        }
      },
      child: SizedBox.shrink(),
    );
  }
}

class _ContinueWithGoogle extends StatelessWidget {
  const _ContinueWithGoogle();

  @override
  Widget build(BuildContext context) {
    final socialSignUpDataState = context.select(
      (SignUpCubit cubit) => cubit.state.socialSignUpDataState,
    );
    return CustomOutlinedButton(
      onPressed: context.read<SignUpCubit>().signUpWithGoogle,
      loading: socialSignUpDataState.key == 'google' &&
          socialSignUpDataState.isLoading,
      enabled:
          socialSignUpDataState.isInitial || socialSignUpDataState.isFailure,
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
    final socialSignUpDataState = context.select(
      (SignUpCubit cubit) => cubit.state.socialSignUpDataState,
    );
    return CustomOutlinedButton(
      onPressed: context.read<SignUpCubit>().signUpWithFacebook,
      loading: socialSignUpDataState.key == 'facebook' &&
          socialSignUpDataState.isLoading,
      enabled:
          socialSignUpDataState.isInitial || socialSignUpDataState.isFailure,
      borderRadius: 4.0,
      width: double.infinity,
      leading: const AssetIcon.multicolor(AssetIcons.facebook_icon),
      text: 'Continue with Facebook',
    );
  }
}
