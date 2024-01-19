import 'package:blogged/models/shared_pref_model.dart';
import 'package:blogged/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});
  Widget _getStartScreen(WidgetRef ref) {
    final userNotifier =
        UserNotifier(user: ref.watch(authenticationProvider).user);
    return userNotifier.determineStartScreen();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeController);
    return ScreenUtilInit(
      designSize: const Size(1290, 2796),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: themeMode,
        title: 'Blogged',
        home: _getStartScreen(ref),
      ),
    );
  }
}
