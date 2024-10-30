part of 'view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static String route() => '/sign_up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        authRepository: AuthRepositoryImpl(
          api: context.read<AuthApi>(),
          fcmToken: '',
        ),
        authCubit: context.read<AuthCubit>().signUpData,
        signUpRepository: SignUpRepositoryImp(
          httpClient: context.read<HttpClient>(),
        ),
      ),
      child: const SignUpView(),
    );
  }
}
