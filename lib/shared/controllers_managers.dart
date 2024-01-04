import 'package:flutter/material.dart';

void disposeControllers(List<ValueNotifier> controllers) {
  for (var controller in controllers) {
    controller.dispose();
  }
}

void clearControllers(List<TextEditingController> controllers) {
  for (var controller in controllers) {
    controller.clear();
  }
}
