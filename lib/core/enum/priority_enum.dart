import 'package:flutter/material.dart';

enum PriorityEnum { low, medium, high }

extension PriorityEnumExtension on PriorityEnum {
  String get title {
    switch (this) {
      case PriorityEnum.low:
        return "Low";
      case PriorityEnum.medium:
        return "Medium";
      case PriorityEnum.high:
        return "High";
    }
  }
}

Color getPriorityColor(String priority) {
  switch (priority) {
    case "Low":
      return Colors.green;
    case "Medium":
      return Colors.yellow;
    case "High":
      return Colors.red;
  }
  return Colors.green;
}
