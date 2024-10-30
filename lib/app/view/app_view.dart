part of 'view.dart';

class AppView extends StatelessWidget {
  const AppView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final router = context.read<AppRouter>();
    return MaterialApp.router(
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: context.mediaQuery.copyWith(
          textScaler: TextScaler.noScaling,
        ),
        child: child!,
      ),
    );
  }
}

class AuthProvider extends SingleChildStatelessWidget {
  const AuthProvider({super.key});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocProvider(
      create: (context) => AuthCubit(
        twoFactorLoginRepository: TwoFactorLoginRepositoryImp(
          httpClient: context.read<HttpClient>(),
        ),
        twoFactorForgotRepository: TwoFactorForgotRepositoryImp(
          httpClient: context.read<HttpClient>(),
        ),
        twoFactorSignRepository: TwoFactorSignRepositoryImp(
          httpClient: context.read<HttpClient>(),
        ),
      ),
      child: child,
    );
  }
}
