import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';
import 'text_field_container.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  void dispose() {
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBorder(
      Consumer(
        builder: (context, ref, child) {
          final isObcured = ref.watch(isObcuredProvider);
          return TextField(
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObcured,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              suffixIcon: IconButton(
                onPressed: () {
                  ref
                      .read(isObcuredProvider.notifier)
                      .update((state) => !state);
                },
                icon: Icon(isObcured
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_rounded),
              ),
            ),
            // textAlignVertical: TextAlignVertical.top,
          );
        },
      ),
    );
  }
}

class ConfirmPasswordTextField extends StatefulWidget {
  final TextEditingController confirmPasswordController;
  const ConfirmPasswordTextField(
      {super.key, required this.confirmPasswordController});

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  @override
  void dispose() {
    widget.confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBorder(
      Consumer(
        builder: (context, ref, child) {
          final isObcured = ref.watch(isObcuredProvider);
          return TextField(
            controller: widget.confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObcured,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                onPressed: () {
                  ref
                      .read(isObcuredProvider.notifier)
                      .update((state) => !state);
                },
                icon: Icon(isObcured
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_rounded),
              ),
            ),
            // textAlignVertical: TextAlignVertical.top,
          );
        },
      ),
    );
  }
}
