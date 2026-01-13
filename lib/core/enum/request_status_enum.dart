import 'package:flutter/material.dart';

enum RequestStatusEnum { pending, fulfilled, cancelled }

extension RequestStatusEnumExtension on RequestStatusEnum {
  String get title {
    switch (this) {
      case RequestStatusEnum.pending:
        return "Pending";
      case RequestStatusEnum.fulfilled:
        return "Fulfilled";
      case RequestStatusEnum.cancelled:
        return "Cancelled";
    }
  }
}

Color getRequestStatusColor(String status) {
  switch (status) {
    case "Pending":
      return Colors.orange;
    case "Fulfilled":
      return Colors.green;
    case "Cancelled":
      return Colors.red;
    default:
      return Colors.grey;
  }
}
