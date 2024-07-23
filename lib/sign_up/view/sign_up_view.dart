part of 'view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                    CustomOutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => CustomPinPut(
                              isSupport: true,
                              title: 'Enter Code',
                              isEmail: true,
                              onPressed: () {
                                showDialog<CustomAlertDialog>(
                                  context: context,
                                  builder: (context) => const CustomAlertDialog(
                                    title: 'Email Verification Complete!',
                                    subTitle:
                                        'Just a few more steps left to complete your account signup.',
                                  ),
                                );
                                Future.delayed(
                                  const Duration(seconds: 4),
                                  () {
                                    Navigator.pop(context);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<TwoFaAuthentication>(
                                        builder: (context) =>
                                            const TwoFaAuthentication(
                                          text: 'Secure My Account',
                                          isSupport: true,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              appBarTitle: 'Email Verification',
                              subTitle: 'We have sent a verification code to',
                            ),
                          ),
                        );
                      },
                      borderRadius: 4.0,
                      width: double.infinity,
                      leading:
                          const AssetIcon.multicolor(AssetIcons.google_icon),
                      text: 'Continue with Google',
                    ),
                    const SizedBox(height: 16),
                    CustomOutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) => CustomPinPut(
                              isSupport: true,
                              title: 'Enter Code',
                              isEmail: true,
                              onPressed: () {
                                showDialog<CustomAlertDialog>(
                                  context: context,
                                  builder: (context) => const CustomAlertDialog(
                                    title: 'Email Verification Complete!',
                                    subTitle:
                                        'Just a few more steps left to complete your account signup.',
                                  ),
                                );
                                Future.delayed(
                                  const Duration(seconds: 4),
                                  () {
                                    Navigator.pop(context);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<TwoFaAuthentication>(
                                        builder: (context) =>
                                            const TwoFaAuthentication(
                                          text: 'Secure My Account',
                                          isSupport: true,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              appBarTitle: 'Email Verification',
                              subTitle: 'We have sent a verification code to',
                            ),
                          ),
                        );
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
                            MaterialPageRoute<SignUpPage>(
                              builder: (context) => CustomPinPut(
                                isSupport: true,
                                title: 'Enter Code',
                                isEmail: true,
                                onPressed: () {
                                  showDialog<CustomAlertDialog>(
                                    context: context,
                                    builder: (context) =>
                                        const CustomAlertDialog(
                                      title: 'Email Verification Complete!',
                                      subTitle:
                                          'Just a few more steps left to complete your account signup.',
                                    ),
                                  );
                                  Future.delayed(
                                    const Duration(seconds: 4),
                                    () {
                                      Navigator.pop(context);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<TwoFaAuthentication>(
                                          builder: (context) =>
                                              const TwoFaAuthentication(
                                            text: 'Secure My Account',
                                            isSupport: true,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                appBarTitle: 'Email Verification',
                                subTitle: 'We have sent a verification code to',
                              ),
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
