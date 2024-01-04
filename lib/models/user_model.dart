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
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      dp: map['dp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? email,
    String? username,
    String? password,
    String? dp,
  }) {
    return User(
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      dp: dp ?? this.dp,
    );
  }
}
