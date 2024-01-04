import 'package:flutter/material.dart';

void snackBar(BuildContext context, String snackBarInfo, [Color? color]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(
        child: Text(
          snackBarInfo,
        ),
      ),
      backgroundColor: color,
    ),
  );
}
