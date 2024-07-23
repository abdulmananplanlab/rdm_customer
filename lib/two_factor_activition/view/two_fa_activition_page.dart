part of 'view.dart';

class TwoFaActivationPage extends StatelessWidget {
  const TwoFaActivationPage({super.key});

  static String routes() => '/two_fa_activation';

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider<TwoFactorActivationCubit>(
        // create: (context) => TwoFactorActivationCubit(),
        // child:

        const TwoFaActivationView();
    // );
  }
}
