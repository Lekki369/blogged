import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/auth_model.dart';
import 'ui_helper.dart';

class Otp {
  final ResponseType otpResponse;
  const Otp({
    required this.otpResponse,
  });

  static Future<ResponseType> sendOTP(
      BuildContext context, Authentication auth) async {
    final userToken = auth.user.responseData?.token;
    if (userToken != null) {
      final response = await auth.verifyEmail(userToken);
      if (response.containsValue('success')) {
        if (context.mounted) {
          return responseWithSnackBar(context, response,
              snackBarMessage: 'OTP sent!!!', color: Colors.green);
        }
      } else if (response.containsValue('error')) {
        if (context.mounted) {
          return responseWithSnackBar(context, response);
        }
      } else {
        if (context.mounted) {
          return responseWithSnackBar(context, response,
              snackBarMessage: 'Error in sending OTP');
        }
      }
    }
    return ResponseType.noResponse;
  }
}
