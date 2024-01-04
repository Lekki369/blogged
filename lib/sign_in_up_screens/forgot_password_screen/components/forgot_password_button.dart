import 'package:blogged/constants.dart';
import 'package:blogged/providers.dart';
import 'package:blogged/shared/controllers_managers.dart';
import 'package:blogged/sign_in_up_screens/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets.dart';

class ForgotPasswordButton extends ConsumerWidget {
  final TextEditingController email;
  const ForgotPasswordButton({super.key, required this.email});

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

                if (!email.text.contains(RegExp('@'))) {
                  snackBar(context, 'Add @something.com!!!');
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
                    snackBar(
                        context, 'Check your email for password reset link');
                    //TODO: to loginscreen

                    // disposeControllers(
                    //     [userName, email, password, confirmPassword]);

                    break;
                  case ResponseType.error:
                    clearControllers([email]);
                    break;
                  case ResponseType.noResponse:
                    clearControllers([email]);
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
