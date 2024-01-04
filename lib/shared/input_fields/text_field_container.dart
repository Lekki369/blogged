import 'package:blogged/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldBorder extends ConsumerWidget {
  final Widget textField;

  const TextFieldBorder(this.textField, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.h),
      decoration: ShapeDecoration(
        color: ref.watch(themeModeControllerProvider) == ThemeMode.light
            ? Colors.green.shade100.withOpacity(.1)
            : Colors.red.shade100.withOpacity(.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: const BorderSide(),
        ),
      ),
      child: textField,
    );
  }
}
