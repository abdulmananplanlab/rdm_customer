import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rdm_builder_customer/app/bloc/app_bloc.dart';
import 'package:rdm_builder_customer/router/router.dart';

part 'app_providers.dart';
part 'app_view.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.unfocus(),
      child: const AppCoreProviders(),
    );
  }
}
