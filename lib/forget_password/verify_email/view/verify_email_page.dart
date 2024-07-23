part of 'view.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({super.key});

  static String route() => '/verify_email';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyEmailCubit(
        verifyEmailRepository: VerifyEmailRepositoryImp(
          httpClient: context.read<HttpClient>(),
        ),
      ),
      child: const VerifyEmailView(),
    );
  }
}
