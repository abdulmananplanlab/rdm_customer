part of 'view.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

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
                      'Forgot Password?',
                      style: context.twenty600,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'No worries. We’ll help you reset your password.',
                      style: context.sixteen400,
                    ),
                    const SizedBox(height: 24),
                    const EmailField(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            const SubmitEmailButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
