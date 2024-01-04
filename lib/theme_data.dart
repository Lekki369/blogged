import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final shapeRoundedBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r));

final buttonStyleDark = ButtonStyle(
  shape: MaterialStatePropertyAll(shapeRoundedBorder),
  textStyle: MaterialStatePropertyAll(
    Typography.whiteCupertino.bodyLarge!,
  ),
);
final buttonStyleLight = ButtonStyle(
  shape: MaterialStatePropertyAll(shapeRoundedBorder),
  textStyle: MaterialStatePropertyAll(
    Typography.blackCupertino.bodyLarge!,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorSchemeSeed: Colors.red,
  textTheme: Typography.whiteCupertino,
  elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyleDark),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
  ),
  textButtonTheme: TextButtonThemeData(style: buttonStyleDark),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    shape: shapeRoundedBorder,
    contentTextStyle: Typography.whiteCupertino.bodyLarge
        ?.copyWith(fontWeight: FontWeight.w500),
  ),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorSchemeSeed: Colors.green,
  textTheme: Typography.blackCupertino,
  elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyleLight),
  inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
  textButtonTheme: TextButtonThemeData(style: buttonStyleLight),
  snackBarTheme: SnackBarThemeData(
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
    shape: shapeRoundedBorder,
    contentTextStyle: Typography.blackCupertino.bodyLarge
        ?.copyWith(fontWeight: FontWeight.w500),
  ),
);
