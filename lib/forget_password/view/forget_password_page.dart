part of 'view.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  static String route() => '/forget';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        forgotPasswordRepository: ForgotPasswordRepositoryImp(
          httpClient: context.read<HttpClient>(),
        ),
      ),
      child: const ForgetPasswordView(),
    );
  }
}
