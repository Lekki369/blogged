import 'package:blogged/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isObcuredProvider = StateProvider((ref) => true);
final isLoadingProvider = StateProvider((ref) => false);
final authProvider = Provider(
  (ref) => Authentication(),
);
final pinPutHasErrorProvider = StateProvider((ref) => false);

final themeModeControllerProvider = StateProvider((ref) => ThemeMode.dark);
