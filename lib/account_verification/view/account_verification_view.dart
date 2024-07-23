part of 'view.dart';

class AccountVerificationView extends StatelessWidget {
  const AccountVerificationView({
    super.key,
    this.isEmailAvailable = false,
    this.iaPasswordAvailable = false,
    this.isForgotPassword = false,
  });

  final bool isEmailAvailable;
  final bool iaPasswordAvailable;
  final bool isForgotPassword;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitleSubtitle(
              title: 'Account Verification',
              subtitle:
                  'Choose an account verification method to ${iaPasswordAvailable ? "reset your password?" : ' sign in to your Account?'} ',
            ),
            SelectedAccountVerificationWidget(
              isEmailAvailable: isEmailAvailable,
            ),
            const Spacer(),
            AccountVerificationButton(
              isEmailAvailable: isEmailAvailable,
              isForgotPassword: isForgotPassword,
            ),
            const SizedBox(height: 16),
            Center(
              child: RichTextWidgets(
                colorTextStyle: context.twelve500.withColor(context.primary500),
                style: context.twelve400,
                colorTitle: 'Customer Support',
                simpleTitle: "Facing issues? We're here to assist. ",
                onTap: (context) {},
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
