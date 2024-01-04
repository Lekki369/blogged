import 'package:blogged/providers.dart';
import 'package:blogged/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sign_in_up_screens/sign_in_screen/sign_in.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1290, 2796),
      builder: (context, child) => Consumer(builder: (context, ref, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: ref.watch(themeModeControllerProvider),
          title: 'Blogged',
          home: const SignIn(),
        );
      }),
    );
  }
}
