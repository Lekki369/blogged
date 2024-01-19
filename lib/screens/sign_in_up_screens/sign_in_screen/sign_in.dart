import 'package:blogged/screens/sign_in_up_screens/sign_up_screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/input_fields/input_fields.dart';
import '../forgot_password_screen/forgot_password.dart';
import 'conponents/sign_in_button.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final textTheme = Theme.of(context)
        .textTheme
        .displaySmall
        ?.copyWith(fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: textTheme,
              ),
            ]),
            SizedBox(height: 50.h),
            EmailTextField(emailController: emailController),
            SizedBox(height: 50.h),
            PasswordField(passwordController: passwordController),
            SizedBox(height: 50.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Forgot Password',
                ),
              ),
            ),
            SignInButton(
              email: emailController,
              password: passwordController,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
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
                        builder: (context) => const SignUp(),
                      ),
                    );
                  },
                  style: Theme.of(context).textButtonTheme.style?.copyWith(
                      textStyle: const MaterialStatePropertyAll(
                          TextStyle(fontWeight: FontWeight.w800))),
                  child: const Text(
                    'Register Now',
                  ),
                ),
              ],
            ),
            SizedBox(height: 80.h),
          ],
        ),
      ),
    );
  }
}
