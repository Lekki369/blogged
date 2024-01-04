import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>?> signUp(String json) async {
    const url = 'https://agma-blogged.onrender.com/api/v1/users/auth/signup';

    Response response = await _dio.post(
      url,
      data: json,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> signIn(Map<String, String> json) async {
    const url = 'https://agma-blogged.onrender.com/api/v1/users/auth/signin';

    Response response = await _dio.post(
      url,
      data: jsonEncode(json),
    );

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> emailVerification(String userToken) async {
    const url =
        'https://agma-blogged.onrender.com/api/v1/users/verifymail/send';

    final json = jsonEncode(
      {
        'headers': {
          'x-access-token': userToken,
        }
      },
    );

    Response response = await _dio.patch(url, data: json);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> emailConfirmation(
      {required userToken, required String otp}) async {
    const url =
        'https://agma-blogged.onrender.com/api/v1/users/verifymail/confirm';
    Response response = await _dio.patch(
      url,
      data: jsonEncode(
        {
          'headers': {'otp': otp, "x-access-token": userToken}
        },
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> forgotPassword({required String email}) async {
    const url = 'https://agma-blogged.onrender.com/api/v1/users/forgotpassword';
    Response response = await _dio.patch(
      url,
      data: jsonEncode(
        {'email': email},
      ),
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
