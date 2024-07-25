import 'package:common/common.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.firstTab,
    required this.secondTab,
  });

  final String firstTab;
  final String secondTab;

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = 0;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: selectedTabIndex == 0
                      ? context.primary500
                      : context.grey200,
                ))),
                child: Center(
                  child: Text(
                    widget.firstTab,
                    style: selectedTabIndex == 0
                        ? context.sixteen600.withColor(context.grey900)
                        : context.sixteen400.withColor(context.grey500),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = 1;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: selectedTabIndex == 1
                      ? context.primary500
                      : context.grey200,
                ))),
                child: Center(
                  child: Text(
                    widget.secondTab,
                    style: selectedTabIndex == 1
                        ? context.sixteen600.withColor(context.grey900)
                        : context.sixteen400.withColor(context.grey500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
