// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResponseData {
  final String token;
  final String uid;
  final bool emailVerfied;

  ResponseData({
    required this.token,
    required this.uid,
    required this.emailVerfied,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'uid': uid,
      'emailVerfied': emailVerfied,
    };
  }

  factory ResponseData.fromMap(Map<String, dynamic> map) {
    return ResponseData(
      token: map['token'] as String,
      uid: map['uid'] as String,
      emailVerfied: map['email_v'] != null ? map['email_v'] as bool : false,
    );
  }

  factory ResponseData.fromJson(String source) =>
      ResponseData.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());
}
