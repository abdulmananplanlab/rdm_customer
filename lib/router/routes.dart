part of 'router.dart';

class AppRoutes {
  AppRoutes._();

  static const initial = '/';
  static const onboarding = '/onboarding';
  // static const forget = '/forget';

  static List<GoRoute> list() => [
        GoRoute(
          path: SplashPage.route(),
          builder: (_, __) => const SplashPage(),
        ),
        GoRoute(
          path: OnBoardingPage.route(),
          builder: (_, __) => const OnBoardingPage(),
        ),
        GoRoute(
          path: LoginPage.route(),
          builder: (_, __) => const LoginPage(),
        ),
        GoRoute(
          path: HomePage.route(),
          builder: (_, __) => const HomePage(),
        ),
        GoRoute(
          path: SignUpPage.route(),
          builder: (_, __) => const SignUpPage(),
        ),
        GoRoute(
          path: AccountVerificationPage.route(),
          builder: (_, __) => const AccountVerificationPage(),
        ),
        GoRoute(
          path: ForgetPasswordPage.route(),
          builder: (_, __) => const ForgetPasswordPage(),
        ),
        // GoRoute(
        //   path: ChangeEmailPage.route(),
        //   builder: (_, __) => const ChangeEmailPage(),
        // ),
        // GoRoute(
        //   path: ChangeNumberPage.route(),
        //   builder: (_, __) => const ChangeNumberPage(),
        // ),
        // GoRoute(
        //   path: NotificationPage.route(),
        //   name: NotificationPage.route(),
        //   builder: (_, __) => const NotificationPage(),
        // ),
        // GoRoute(
        //   path: TabPage.path(),
        //   builder: (_, state) => TabPage(
        //     key: state.pageKey,
        //     page: state.pathParameters['page']!,
        //   ),
        // ),
        GoRoute(
          path: AccountVerificationPage.route(),
          builder: (_, __) => const AccountVerificationPage(),
        ),
        GoRoute(
          path: ForgetPasswordPage.route(),
          builder: (_, __) => const ForgetPasswordPage(),
        ),
        // GoRoute(
        //   path: ChangeEmailPage.route(),
        //   builder: (_, __) => const ChangeEmailPage(),
        // ),
        // GoRoute(
        //   path: ChangeNumberPage.route(),
        //   builder: (_, __) => const ChangeNumberPage(),
        // ),
        // GoRoute(
        //   path: NotificationPage.route(),
        //   name: NotificationPage.route(),
        //   builder: (_, __) => const NotificationPage(),
        // ),
        GoRoute(
          path: TabPage.path(),
          builder: (_, state) => TabPage(
            key: state.pageKey,
            page: state.pathParameters['page']!,
          ),
        ),
      ];
}
