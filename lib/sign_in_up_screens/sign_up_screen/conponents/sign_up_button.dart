import 'package:blogged/constants.dart';
import 'package:blogged/providers.dart';
import 'package:blogged/shared/controllers_managers.dart';
import 'package:blogged/shared/widgets.dart';
import 'package:blogged/sign_in_up_screens/otp_pin_screen/otp_pin.dart';
import 'package:blogged/sign_in_up_screens/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../otp.dart';

class SignUpButton extends ConsumerWidget {
  final TextEditingController userName;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  const SignUpButton({
    super.key,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(isLoadingProvider);
    final auth = ref.read(authProvider);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
                loading(ref);

                if (userName.text.isEmpty ||
                    email.text.isEmpty ||
                    password.text.isEmpty ||
                    confirmPassword.text.isEmpty) {
                  snackBar(context, 'Fill all field!!!');
                  loading(ref);
                  return;
                }
                if (userName.text.length <= 3) {
                  snackBar(context, 'Username must be greater three!!!');
                  loading(ref);
                  return;
                }

                if (!email.text.contains(RegExp('@'))) {
                  snackBar(context, 'Add @something.com!!!');
                  loading(ref);
                  return;
                }
                if (password.text.length <= 6 ||
                    confirmPassword.text.length <= 6) {
                  snackBar(context, 'Password must be greater six!!!');
                  loading(ref);
                  return;
                }
                if (password.text != confirmPassword.text ||
                    confirmPassword.text != password.text) {
                  snackBar(context, 'Check password!!!');
                  loading(ref);
                  return;
                }
                final response =
                    await auth.signUp(userName.text, email.text, password.text);
                if (!context.mounted) return;
                final responseType = responseWithSnackBar(context, response);
                loading(ref);
                switch (responseType) {
                  case ResponseType.success:
                    final getOtpResponse = await Otp.sendOTP(context, auth);
                    if (getOtpResponse == ResponseType.success) {
                      if (!context.mounted) return;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OtpPinScreen(),
                          ));
                      // disposeControllers(
                      //     [userName, email, password, confirmPassword]);
                    }

                    break;
                  case ResponseType.error:
                    clearControllers(
                        [userName, email, password, confirmPassword]);
                    break;
                  case ResponseType.noResponse:
                    clearControllers(
                        [userName, email, password, confirmPassword]);
                    break;
                }
              },
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator.adaptive(),
              )
            : const Text(
                'Proceed',
              ),
      ),
    );
  }
}
