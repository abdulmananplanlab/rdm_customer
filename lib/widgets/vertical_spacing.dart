import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
    super.key,
    this.of = 16.0,
  });
  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: of);
  }
}
