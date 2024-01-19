// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blogged/models/auth_model.dart';
import 'package:blogged/models/shared_pref_model.dart';
import 'package:blogged/screens/home_screen/home_screen.dart';
import 'package:blogged/screens/sign_in_up_screens/sign_in_screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

final stateIsObscured = StateProvider((ref) => true);
final stateIsLoading = StateProvider((ref) => false);

final authenticationProvider = Provider((ref) => Authentication());
final stateHasPinPutError = StateProvider((ref) => false);

final themeModeController = StateProvider((ref) => ThemeMode.light);

class UserNotifier {
  final User user;
  final _pref = SharedPref();
  UserNotifier({
    required this.user,
  });

  User? getStoredUser() {
    final storedUserJson = _pref.get();
    if (storedUserJson != null) {
      return User.fromJson(storedUserJson);
    }
    return null;
  }

  Widget determineStartScreen() {
    final user = getStoredUser();
    if (user != null) {
      return const HomeScreen();
    }
    return const SignIn();
  }

  void writeUser() {
    _pref.write(user.toJson());
  }

  void deleteUser() => _pref.delete();
}
