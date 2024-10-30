part of 'view.dart';

class TwoFaAuthenticatorAppPage extends StatelessWidget {
  const TwoFaAuthenticatorAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TwoFaAuthenticationAppCubit(
        token: context.read<AuthCubit>().state.signUpDataSate.data?.token ??
            context.read<AuthRepository>().currentUser.token,
        twoFaAuthenticatorRepository: TwoFaAuthenticatorRepositoryImpl(
          httpClient: context.read<HttpClient>(),
        ),
      ),
      child: const TwoFaAuthenticatorApp(),
    );
  }
}
