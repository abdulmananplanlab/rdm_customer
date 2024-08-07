import 'dart:async';

import 'package:common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rdm_builder_customer/account_verification/account_verification.dart';
import 'package:rdm_builder_customer/app/bloc/app_bloc.dart';
import 'package:rdm_builder_customer/forget_password/forget_password.dart';
import 'package:rdm_builder_customer/home/view/home/view.dart';
import 'package:rdm_builder_customer/login/view/view.dart';
import 'package:rdm_builder_customer/notification/notification.dart';
import 'package:rdm_builder_customer/onboarding/onboarding.dart';
import 'package:rdm_builder_customer/sign_up/view/view.dart';
import 'package:rdm_builder_customer/splash/view/view.dart';
import 'package:rdm_builder_customer/tab/tab.dart';

part 'routes.dart';

class AppRouter {
  AppRouter({
    AppBloc? appBloc,
    String? intiialRoute,
    List<RouteBase>? routes,
    GlobalKey<NavigatorState>? navigatorKey,
    List<NavigatorObserver>? observers,
  }) : router = GoRouter(
          navigatorKey: navigatorKey,
          initialLocation: intiialRoute ?? AppRoutes.initial,
          routes: routes ?? AppRoutes.list(),
          observers: [...?observers],
          refreshListenable:
              appBloc != null ? AppRouterRefreshStream([appBloc.stream]) : null,
          redirect: appBloc != null
              ? (context, state) async {
                  $debugLog(state.uri, tag: 'route');
                  final appState = appBloc.state;

                  // if the user is not loaded, they must wait
                  final loaded = !appState.isLoading;
                  final loading = state.fullPath == SplashPage.route();
                  if (!loaded) {
                    return loading ? null : SplashPage.route();
                  }

                  // if the user is not logged in, they must login
                  final loggedIn = !appState.isAuthenticated;
                  final isOnboared = await appBloc.authRepository.onboarding;
                  final loggingIn = state.matches(OnBoardingPage.route());
                  if (!loggedIn) {
                    if (loggingIn) {
                      return null;
                    }
                    if (isOnboared) {
                      final signup = state.matches(SignUpPage.route()) ||
                          state.matches(AccountVerificationPage.route());
                      return signup ? null : LoginPage.route();
                    }
                    return OnBoardingPage.route();
                  }

                  // - [loading] if the user is loaded but still on the splash page,
                  // redirect to the home page
                  // - [loggingIn] if the user is logged in but still on the login page,
                  // redirect to the home page
                  // - [onboarding] if the user is onboarded but still on the onboarding
                  // page, redirect to the home page
                  if (loading || loggingIn || loggedIn) {
                    return TabPage.routeWithFirstTab();
                  }

                  // no need to redirect at all
                  return null;
                }
              : null,
        );

  @visibleForTesting
  final GoRouter router;

  RouteInformationProvider get routeInformationProvider =>
      router.routeInformationProvider;

  RouteInformationParser<Object> get routeInformationParser =>
      router.routeInformationParser;

  RouterDelegate<Object> get routerDelegate => router.routerDelegate;
}

class AppRouterRefreshStream extends ChangeNotifier {
  AppRouterRefreshStream(List<Stream<dynamic>> streams) {
    notifyListeners();
    _subscriptions = streams
        .map((e) => e.asBroadcastStream().listen((_) => notifyListeners()))
        .toList();
  }

  late final List<StreamSubscription<dynamic>> _subscriptions;

  @override
  void dispose() {
    for (final e in _subscriptions) {
      e.cancel();
    }
    super.dispose();
  }
}
