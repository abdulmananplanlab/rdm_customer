part of 'view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static String route() => '/sign_up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        signUpRepository: SignUpRepositoryImp(
          httpClient: context.read<HttpClient>(),
        ),
      ),
      child: const SignUpView(),
    );
  }
}
