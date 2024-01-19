import 'package:blogged/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/custom_snacknar_widgets.dart';

void loading(WidgetRef ref) {
  ref.read(stateIsLoading.notifier).update((state) => !state);
}

ResponseType responseWithSnackBar(
    BuildContext context, Map<ResponseType, dynamic> response,
    {String? snackBarMessage, Color? color, bool showSnackbar = false}) {
  if (response.containsKey(
    ResponseType.success,
  )) {
    if (snackBarMessage != null) {
      showCustomSnackBar(context, snackBarMessage, color);
    }
    return ResponseType.success;
  } else if (response.containsKey(ResponseType.error)) {
    showCustomSnackBar(
        context, snackBarMessage ?? response[ResponseType.error], color);
    return ResponseType.noResponse;
  } else {
    showCustomSnackBar(context, snackBarMessage ?? 'Error', color);
    return ResponseType.noResponse;
  }
}
