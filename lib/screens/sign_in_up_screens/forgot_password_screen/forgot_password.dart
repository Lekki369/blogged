import 'package:blogged/screens/sign_in_up_screens/forgot_password_screen/components/forgot_password_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/input_fields/username_email_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    final TextEditingController emailController = TextEditingController();
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
                'Let\'s get you back!',
                style: textTheme,
              )
            ]),
            SizedBox(height: 50.h),
            EmailTextField(emailController: emailController),
            SizedBox(height: 50.h),
            ForgotPasswordButton(email: emailController),
          ],
        ),
      ),
    );
  }
}
