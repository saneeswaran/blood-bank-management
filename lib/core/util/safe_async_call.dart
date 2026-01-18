import 'dart:developer';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

typedef AsyncTask<T> = Future<Either<String, T>> Function();

Future<T?> safeAsyncCall<T>({
  //TODO : handle this later update
  required BuildContext context,
  required AsyncTask<T> task,

  bool showLoader = true,
  String? successMessage,

  VoidCallback? onSuccess,
  void Function(T data)? onData,
}) async {
  if (showLoader) {
    MaterialUtil.showFullScreenLoader(context);
  }

  try {
    final result = await task();

    return result.fold(
      (error) {
        log(error);
        if (showLoader) Navigator.pop(context);

        customSnackBar(context: context, content: error, type: SnackType.error);
        return null;
      },
      (data) {
        if (showLoader) Navigator.pop(context);

        if (successMessage != null) {
          customSnackBar(
            context: context,
            content: successMessage,
            type: SnackType.success,
          );
        }

        onData?.call(data);
        onSuccess?.call();
        return data;
      },
    );
  } catch (e) {
    if (!context.mounted) return null;
    if (showLoader) Navigator.pop(context);
    log(e.toString());

    customSnackBar(
      context: context,
      content: "Something went wrong",
      type: SnackType.error,
    );
    return null;
  }
}
