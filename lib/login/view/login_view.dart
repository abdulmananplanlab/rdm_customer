part of 'view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  JsonObject? _userData;
  AccessToken? _accessToken;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.noBar(),
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
                    const ContinueWithGoogleButton(),
                    const SizedBox(height: 16),
                    CustomOutlinedButton(
                      onPressed: () async {
                        final LoginResult result =
                            await FacebookAuth.instance.login();
                        if (result.status == LoginStatus.success) {
                          _accessToken = result.accessToken;
                          // get the user data
                          // by default we get the userId, email,name and picture
                          final userData =
                              await FacebookAuth.instance.getUserData();
                          // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
                          _userData = userData;
                          $debugLog(_accessToken);
                          $debugLog(_userData);
                        } else {
                          $debugLog(result.status);
                          $debugLog(result.message);
                        }
                      },
                      borderRadius: 4.0,
                      width: double.infinity,
                      leading:
                          const AssetIcon.multicolor(AssetIcons.facebook_icon),
                      text: 'Continue with Facebook',
                    ),
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
      ),
    );
  }
}

class ContinueWithGoogleButton extends StatelessWidget {
  const ContinueWithGoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginDataState != current.loginDataState,
      buildWhen: (previous, current) =>
          previous.loginDataState != current.loginDataState,
      listener: (context, state) {
        if (state.loginDataState.isLoaded) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute<AccountVerificationPage>(
              builder: (_) => const AccountVerificationPage(),
            ),
          );
        }
        if (state.loginDataState.isFailure) {
          context.errorSnackbar(state.loginDataState.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomOutlinedButton(
          onPressed: context.read<LoginCubit>().loginWithGoogle,
          loading: state.loginDataState.isLoading,
          borderRadius: 4.0,
          width: double.infinity,
          leading: const AssetIcon.multicolor(AssetIcons.google_icon),
          text: 'Continue with Google',
        );
      },
    );
  }
}
