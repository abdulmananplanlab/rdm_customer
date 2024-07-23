
import 'package:common/common.dart';

enum AppEnvironment {
  prod(
    config: HttpClientConfig(
      baseUrl: 'https://demo---cxai-service-hzs3agupka-uc.a.run.app/',
    ),
  ),
  dev(
    config: HttpClientConfig(
      baseUrl: 'https://demo---cxai-service-hzs3agupka-uc.a.run.app/',
      enableLogs: true,
    ),
  );

  const AppEnvironment({
    required this.config,
  });

  final HttpClientConfig config;

  bool get isProd => this == AppEnvironment.prod;
  bool get isDev => this == AppEnvironment.dev;

  static AppEnvironment _current = AppEnvironment.dev;
  static AppEnvironment get current => _current;
  static set current(AppEnvironment env) => _current = env;
}
