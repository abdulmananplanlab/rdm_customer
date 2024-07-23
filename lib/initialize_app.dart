import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rdm_builder_customer/app/view/view.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (AppEnvironment.current.isDev) {
      bloc.$debugPrint(change, tag: 'onChange');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    bloc.$debugPrint('($error, $stackTrace)', tag: 'onError');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> initializeApp(Callback<FutureOr<void>> config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheStorage.initialize();
  CachedBloc.initialize();

  await AssetImages.preloadLogoBackground();
  await config();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Bloc.observer = AppBlocObserver();

  runApp(const App());
}
