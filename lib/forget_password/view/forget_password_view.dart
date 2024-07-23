part of 'view.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Sign In',
      ),
      backgroundColor: context.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Set a New Password',
                      style: context.twenty600,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Make sure the new password is different from your old password.',
                      style: context.sixteen400,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Password',
                      style: context.fourteen400,
                    ),
                    const SizedBox(height: 8),
                    const NewPasswordField(),
                    const SizedBox(height: 40),
                    Text(
                      'Re-Enter Password',
                      style: context.fourteen400,
                    ),
                    const SizedBox(height: 8),
                    const ConfirmPasswordFiled(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            const ResetPasswordButton(),
            const SizedBox(height: 16),
            Center(
              child: RichTextWidgets(
                style: context.twelve400,
                colorTextStyle: context.twelve500.withColor(context.primary500),
                colorTitle: 'Customer Support',
                simpleTitle: "Facing issues? We're here to assist. ",
                onTap: (context) {},
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
