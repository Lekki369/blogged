import 'package:flutter/material.dart';

import '../text_field_container.dart';

class UserNameTextField extends StatefulWidget {
  final TextEditingController usernameController;
  const UserNameTextField({
    super.key,
    required this.usernameController,
  });

  @override
  State<UserNameTextField> createState() => _UserNameTextFieldState();
}

class _UserNameTextFieldState extends State<UserNameTextField> {
  @override
  void dispose() {
    widget.usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBorder(
      TextField(
        controller: widget.usernameController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          hintText: 'Username',
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

class EmailTextField extends StatefulWidget {
  final TextEditingController emailController;
  const EmailTextField({
    super.key,
    required this.emailController,
  });

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  void dispose() {
    widget.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBorder(
      TextField(
        controller: widget.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Enter your email',
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
