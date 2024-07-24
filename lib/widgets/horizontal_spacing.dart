import 'package:flutter/material.dart';

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({
    super.key,
    this.of = 16.0,
  });
  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: of);
  }
}
