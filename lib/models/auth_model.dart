import 'model.dart';

class Authentication {
  final Api _api = Api();
  User _user = User();

  User get user => _user;

  Map<ResponseType, dynamic> parseResponseData(Map<String, dynamic>? response) {
    if (response != null) {
      if (response['status'] == 'success') {
        if (response.containsKey('response')) {
          final data = ResponseData.fromMap(
            response['response'],
          );
          _user.responseData = data;

          return {ResponseType.success: 'Successful'};
        } else {
          final status = response['status'];
          return {ResponseType.success: status as String};
        }
      } else if (response['status'] == 'error') {
        final error = BlogError.getErrorByCode(response['code'].toString());
        return {ResponseType.error: error};
      } else {
        return {
          ResponseType.noResponse:
              'Some issues came up, we are resolving it. Try again!'
        };
      }
    } else {
      return {
        ResponseType.noResponse:
            'Some issues came up, we are resolving it. Try again!'
      };
    }
  }

  Future<Map<ResponseType, dynamic>> signUp(
      String username, String email, String password,
      [String? dp]) async {
    _user = _user.copyWith(
      username: username,
      email: email,
      password: password,
      dp: dp,
    );

    var response = await _api.signUp(
      _user.toJson(),
    );
    // print(response.runtimeType);
    return parseResponseData(response);
  }

  Future<Map<ResponseType, dynamic>> signIn(
      String email, String password) async {
    _user = _user.copyWith(email: email, password: password);

    var response = await _api.signIn({
      'email': _user.email!,
      'password': _user.password!,
    });
    return parseResponseData(response);
  }

  Future<Map<ResponseType, dynamic>> verifyEmail(String userToken) async {
    var response = await _api.emailVerification(userToken);

    return parseResponseData(response);
  }

  Future<Map<ResponseType, dynamic>> confirmEmail({required String otp}) async {
    var response = await _api.emailConfirmation(
      userToken: _user.responseData?.token,
      otp: otp,
    );

    return parseResponseData(response);
  }

  Future<Map<ResponseType, dynamic>> forgotPassword(String email) async {
    var response = await _api.forgotPassword(email: email);
    return parseResponseData(response);
  }
}
