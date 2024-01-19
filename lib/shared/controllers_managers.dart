import 'package:flutter/material.dart';

void clearTextControllers(List<TextEditingController> controllers) {
  for (var controller in controllers) {
    controller.clear();
  }
}
