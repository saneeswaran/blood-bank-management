import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

enum SnackType { success, error, info }

void customSnackBar({
  required BuildContext context,
  required String content,
  required SnackType type,
  Duration duration = const Duration(seconds: 2),
  Color textColor = Colors.black,
}) {
  toastification.show(
    context: context,
    title: Text(content, style: TextStyle(color: textColor)),
    type: type == SnackType.success
        ? ToastificationType.success
        : type == SnackType.error
        ? ToastificationType.error
        : ToastificationType.info,
    style: ToastificationStyle.flat,
    autoCloseDuration: duration,
    alignment: Alignment.topCenter,
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.none,
  );
}
