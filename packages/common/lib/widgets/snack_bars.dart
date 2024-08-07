import 'package:common/common.dart';
import 'package:flutter/material.dart';

class Snackbars {
  const Snackbars._();

  static SnackBar success(
    BuildContext context, {
    required String text,
  }) =>
      _snackbar(context, text, Icons.check_rounded);

  static SnackBar error(
    BuildContext context, {
    required String text,
  }) =>
      _snackbar(context, text, Icons.warning_amber_rounded);

  static SnackBar info(
    BuildContext context, {
    required String text,
  }) =>
      _snackbar(context, text, Icons.info_outline_rounded);

  static SnackBar _snackbar(
    BuildContext context,
    String text,
    IconData icon,
  ) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(
            icon,
            color: context.onDark,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: context.sixteen400.onDark(context),
            ),
          ),
        ],
      ),
    );
  }
}
