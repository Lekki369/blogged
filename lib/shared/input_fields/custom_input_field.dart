import 'package:blogged/shared/input_fields/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool? obsureText;
  const CustomInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.textInputType,
      this.obsureText});

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldBorder(
      Consumer(
        builder: (context, ref, child) {
          final isObcured = ref.watch(stateIsObscured);
          return TextField(
            controller: widget.controller,
            keyboardType: widget.textInputType,
            obscureText: widget.obsureText != null ? isObcured : false,
            decoration: InputDecoration(
                hintText: widget.hintText,
                suffixIcon: widget.obsureText != null
                    ? IconButton(
                        onPressed: () {
                          ref
                              .read(stateIsObscured.notifier)
                              .update((state) => !state);
                        },
                        icon: Icon(isObcured
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_rounded),
                      )
                    : null),
            // textAlignVertical: TextAlignVertical.top,
          );
        },
      ),
    );
  }
}
