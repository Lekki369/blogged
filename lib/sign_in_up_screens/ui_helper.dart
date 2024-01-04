import 'package:blogged/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import '../shared/widgets.dart';

void loading(WidgetRef ref) {
  ref.read(isLoadingProvider.notifier).update((state) => !state);
}

ResponseType responseWithSnackBar(
  BuildContext context,
  Map<ResponseType, dynamic> response, {
  String? snackBarMessage,
  Color? color,
}) {
  if (response.containsKey(ResponseType.success)) {
    snackBar(context, snackBarMessage ?? 'Success', color);
    return ResponseType.success;
  } else if (response.containsKey(ResponseType.error)) {
    snackBar(
        context, snackBarMessage ?? response[ResponseType.error] ?? '', color);
    return ResponseType.noResponse;
  } else {
    snackBar(context, snackBarMessage ?? 'Error', color);
    return ResponseType.noResponse;
  }
}
