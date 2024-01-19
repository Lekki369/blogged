// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:blogged/models/response_data_model.dart';

class User {
  final String? email;
  final String? username;
  final String? password;
  final String dp;
  ResponseData? responseData;

  User(
      {this.username,
      this.email,
      this.password,
      this.dp = 'none',
      this.responseData});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'password': password,
      'dp': dp,
      'responseData': responseData?.toMap()
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        username: map['username'],
        email: map['email'],
        password: map['password'],
        dp: map['dp'],
        responseData: ResponseData.fromMap(map['responseData']));
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith(
      {String? email,
      String? username,
      String? password,
      String? dp,
      ResponseData? responseData}) {
    return User(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      dp: dp ?? this.dp,
      responseData: responseData ?? this.responseData,
    );
  }
}
