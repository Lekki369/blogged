import 'package:blogged/screens/sign_in_up_screens/sign_in_screen/sign_in.dart';
import 'package:blogged/screens/sign_in_up_screens/ui_helper.dart';
import 'package:blogged/shared/controllers_managers.dart';
import 'package:blogged/utils/constants.dart';
import 'package:blogged/utils/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/custom_snacknar_widgets.dart';

class ForgotPasswordButton extends ConsumerWidget {
  final TextEditingController email;
  const ForgotPasswordButton({super.key, required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(stateIsLoading);
    final auth = ref.read(authenticationProvider);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading
            ? null
            : () async {
                loading(ref);

                if (!email.text.contains(RegExp('@'))) {
                  showCustomSnackBar(context, 'Add @something.com!!!');
                  loading(ref);
                  return;
                }

                final response = await auth.forgotPassword(
                  email.text,
                );
                if (!context.mounted) return;
                final responseType = responseWithSnackBar(context, response);
                loading(ref);
                switch (responseType) {
                  case ResponseType.success:
                    showCustomSnackBar(
                        context, 'Check your email for password reset link');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                        (route) => false);
                    break;
                  case ResponseType.error:
                    clearTextControllers([email]);
                    break;
                  case ResponseType.noResponse:
                    clearTextControllers([email]);
                    break;
                }
              },
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator.adaptive(),
              )
            : const Text(
                'Forgot Password',
              ),
      ),
    );
  }
}
