import 'package:flutter/material.dart';

enum SnackType { success, error, info }

void customSnackBar({
  required BuildContext context,
  required String content,
  required SnackType type,
  Duration duration = const Duration(seconds: 2),
  final Color textColor = Colors.white,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration,
      backgroundColor: type == SnackType.success
          ? Colors.green
          : type == SnackType.error
          ? Colors.red
          : Colors.grey.shade400,
      content: Text(content, style: const TextStyle(color: Colors.white)),
    ),
  );
}
