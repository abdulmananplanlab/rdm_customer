import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    this.controller,
  });
  final List<String> tabs;
  final TabController? controller;
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: context.primary500,
      isScrollable: true,
      labelStyle: context.sixteen600,
      overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      tabAlignment: TabAlignment.start,
      labelPadding: const EdgeInsets.all(16.0),
      unselectedLabelStyle: context.sixteen400,
      tabs: tabs.map((tab) => Text(tab)).toList(),
    );
  }
}
