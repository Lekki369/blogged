import 'package:blogged/screens/home_screen/home_screen.dart';
import 'package:blogged/screens/sign_in_up_screens/otp.dart';
import 'package:blogged/screens/sign_in_up_screens/otp_pin_screen/otp_pin.dart';
import 'package:blogged/screens/sign_in_up_screens/ui_helper.dart';
import 'package:blogged/shared/controllers_managers.dart';
import 'package:blogged/shared/custom_snacknar_widgets.dart';
import 'package:blogged/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInButton extends ConsumerWidget {
  final TextEditingController email;
  final TextEditingController password;

  const SignInButton({
    super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(stateIsLoading);
    final auth = ref.read(authenticationProvider);
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          // style: Theme.of(context).elevatedButtonTheme.style,
          onPressed: isLoading
              ? null
              : () async {
                  loading(ref);
                  if (email.text.isEmpty || password.text.isEmpty) {
                    showCustomSnackBar(context, 'Fill all field!!!');
                    loading(ref);
                    return;
                  }

                  if (!email.text.contains(RegExp('@'))) {
                    showCustomSnackBar(context, 'Add @something.com!!!');
                    loading(ref);
                    return;
                  }
                  if (password.text.length <= 6) {
                    showCustomSnackBar(
                        context, 'Password must be greater six!!!');
                    loading(ref);
                    return;
                  }
                  final response = await auth.signIn(email.text, password.text);
                  if (!context.mounted) return;
                  final responseType = responseWithSnackBar(context, response);
                  loading(ref);

                  switch (responseType) {
                    case ResponseType.success:
                      if (auth.user.responseData?.emailVerfied != true) {
                        final getOtpResponse = await Otp.sendOTP(context, auth);

                        if (getOtpResponse == ResponseType.success) {
                          if (!context.mounted) return;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OtpPinScreen(),
                              ));
                        }
                      }
                      UserNotifier(user: auth.user).writeUser();
                      if (!context.mounted) return;
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false);
                      break;
                    case ResponseType.error:
                      clearTextControllers([email, password]);
                      break;
                    case ResponseType.noResponse:
                      clearTextControllers([email, password]);
                      break;
                  }
                },
          child: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator.adaptive(),
                )
              : const Text(
                  'Login',
                ),
        ));
  }
}
