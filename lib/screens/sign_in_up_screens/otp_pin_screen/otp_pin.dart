import 'package:blogged/screens/home_screen/home_screen.dart';
import 'package:blogged/screens/sign_in_up_screens/ui_helper.dart';
import 'package:blogged/utils/constants.dart';
import 'package:blogged/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpPinScreen extends StatelessWidget {
  const OtpPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PinTheme defaultTheme(WidgetRef ref) => PinTheme(
          textStyle: Theme.of(context).textTheme.displaySmall,
          decoration: BoxDecoration(
            color: ref.watch(themeModeController) == ThemeMode.light
                ? Colors.green.shade100.withOpacity(.1)
                : Colors.red.shade100.withOpacity(.1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20.r),
          ),
          height: 200.h,
          width: 200.w,
        );
    final textTheme = Theme.of(context)
        .textTheme
        .displaySmall
        ?.copyWith(fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          children: [
            Wrap(
              children: [
                Text(
                  'Verify your email',
                  style: textTheme,
                ),
              ],
            ),
            SizedBox(height: 80.h),
            Consumer(builder: (context, ref, child) {
              return Pinput(
                length: 6,
                defaultPinTheme: defaultTheme(ref),
                errorPinTheme: defaultTheme(ref).copyWith(
                  decoration: defaultTheme(ref).decoration?.copyWith(
                        border: Border.all(color: Colors.red),
                      ),
                ),
                forceErrorState: ref.watch(stateHasPinPutError),
                errorText: 'Incorrect OTP',
                errorTextStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
                onCompleted: (otp) async {
                  final auth = ref.read(authenticationProvider);

                  final otpResponse = await auth.confirmEmail(otp: otp);
                  if (otpResponse.containsKey(ResponseType.success)) {
                    UserNotifier(user: auth.user).writeUser();
                    if (!context.mounted) return;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                        (route) => false);
                  } else if (otpResponse.containsKey(ResponseType.error)) {
                    ref
                        .read(stateHasPinPutError.notifier)
                        .update((state) => !state);
                  } else {
                    if (!context.mounted) return;
                    responseWithSnackBar(context, otpResponse);
                  }
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
