import 'package:flutter/material.dart';

void showCustomSnackBar(
  BuildContext context,
  String message, [
  Color? color,
  Duration duration = const Duration(seconds: 4),
]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Theme.of(context).snackBarTheme.backgroundColor,
      duration: duration,
    ),
  );
}
