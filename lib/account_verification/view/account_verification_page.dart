part of 'view.dart';

class AccountVerificationPage extends StatelessWidget {
  const AccountVerificationPage({
    super.key,
    this.isEmailAvailable = false,
    this.isPasswordAvailable = false,
    this.isForgotPassword = false,
  });

  static String route() => '/AccountVerification';

  final bool isEmailAvailable;
  final bool isPasswordAvailable;
  final bool isForgotPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountVerificationCubit>(
      create: (context) => AccountVerificationCubit(),
      child: AccountVerificationView(
        isEmailAvailable: isEmailAvailable,
        iaPasswordAvailable: isPasswordAvailable,
        isForgotPassword: isForgotPassword,
      ),
    );
  }
}
