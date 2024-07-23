import 'package:common/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.appBar,
    this.body,
    this.drawer,
  });
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.white,
      drawer: drawer,
      appBar: appBar,
      body: body,
    );
  }
}
