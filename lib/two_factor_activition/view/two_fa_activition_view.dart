part of 'view.dart';

class TwoFaActivationView extends StatefulWidget {
  const TwoFaActivationView({super.key});

  @override
  State<TwoFaActivationView> createState() => _TwoFaActivationViewState();
}

class _TwoFaActivationViewState extends State<TwoFaActivationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '2FA Activation',
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
                    const CustomProgressBar(),
                    const SizedBox(height: 24),
                    Text(
                      'Step 1 of 5',
                      style: context.sixteen500.withColor(context.primary500),
                    ),
                    const SizedBox(height: 8),
                    const CustomTitleSubtitle(
                      title: 'Phone Number Verification',
                      subtitle:
                          'A verification code will be sent to your phone number',
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Enter Your Phone Number',
                      style: context.sixteen400,
                    ),
                    const SizedBox(height: 8),
                    const PhoneNumberAuthentication(),
                  ],
                ),
              ),
            ),
            const SendCodeButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
