import 'package:blogged/shared/input_fields/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordField({
    super.key,
    required this.passwordController,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
          final isObcured = ref.watch(stateIsObscured);
          return TextField(
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObcured,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(stateIsObscured.notifier).update((state) => !state);
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

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController confirmPasswordController;
  const ConfirmPasswordField(
      {super.key, required this.confirmPasswordController});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
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
          final isObcured = ref.watch(stateIsObscured);
          return TextField(
            controller: widget.confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscureText: isObcured,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(stateIsObscured.notifier).update((state) => !state);
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
