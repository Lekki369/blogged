import 'package:blogged/sign_in_up_screens/sign_in_screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/input_fields/input_fields.dart';
import 'conponents/sign_up_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController userNameController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    final textTheme = Theme.of(context).textTheme.displaySmall?.copyWith(
          fontWeight: FontWeight.bold,
        );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(children: [
              Text(
                'Hello! Register to get started',
                style: textTheme,
              ),
            ]),
            SizedBox(height: 50.h),
            UserNameTextField(usernameController: userNameController),
            SizedBox(height: 50.h),
            EmailTextField(emailController: emailController),
            SizedBox(height: 50.h),
            PasswordTextField(passwordController: passwordController),
            SizedBox(height: 50.h),
            ConfirmPasswordTextField(
                confirmPasswordController: confirmPasswordController),
            SizedBox(height: 50.h),
            SignUpButton(
              userName: userNameController,
              email: emailController,
              password: passwordController,
              confirmPassword: confirmPasswordController,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    style: Theme.of(context).textButtonTheme.style?.copyWith(
                        textStyle: const MaterialStatePropertyAll(
                            TextStyle(fontWeight: FontWeight.w800))),
                    child: const Text('Login Now')),
              ],
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
