import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final shapeRoundedBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r));

// In button_styles.dart
final ButtonStyle buttonStyleDark = ButtonStyle(
  shape: WidgetStateProperty.all(shapeRoundedBorder),
  textStyle: WidgetStateProperty.all(
    Typography.whiteCupertino.bodyLarge!,
  ),
);

final ButtonStyle buttonStyleLight = ButtonStyle(
  shape: WidgetStateProperty.all(shapeRoundedBorder),
  textStyle: WidgetStateProperty.all(
    Typography.blackCupertino.bodyLarge!,
  ),
);

final ThemeData baseTheme = ThemeData(
  useMaterial3: true,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
  snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      shape: shapeRoundedBorder,
      contentTextStyle: Typography.blackCupertino.bodyLarge
          ?.copyWith(fontWeight: FontWeight.w500)),
);

final ThemeData darkTheme = baseTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
  // Add dark theme-specific settings here
  elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyleDark),

  textButtonTheme: TextButtonThemeData(style: buttonStyleDark),
);

final ThemeData lightTheme = baseTheme.copyWith(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  // Add light theme-specific settings here
  elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyleLight),
  textButtonTheme: TextButtonThemeData(style: buttonStyleLight),
  // ... other light-specific settings
);
