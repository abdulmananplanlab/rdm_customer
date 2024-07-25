import 'package:common/common.dart';
import 'package:flutter/material.dart';

class FilterSelectionWidget extends StatefulWidget {
  const FilterSelectionWidget({
    super.key,
    required this.firstTab,
    required this.secondTab,
  });

  final String firstTab;
  final String secondTab;

  @override
  State<FilterSelectionWidget> createState() => _FilterSelectionWidgetState();
}

class _FilterSelectionWidgetState extends State<FilterSelectionWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                decoration: BoxDecoration(
                  color:
                      selectedIndex == 0 ? context.primary500 : context.white,
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(16)),
                ),
                child: Text(
                  widget.firstTab,
                  style: context.sixteen400.withColor(
                      selectedIndex == 1 ? context.primary500 : context.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                  decoration: BoxDecoration(
                    color:
                        selectedIndex == 1 ? context.primary500 : context.white,
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.circular(16)),
                  ),
                  child: Text(widget.secondTab,
                      style: context.sixteen400.withColor(selectedIndex == 1
                          ? context.white
                          : context.primary500))),
            ),
          ],
        ),
      ],
    );
  }
}
