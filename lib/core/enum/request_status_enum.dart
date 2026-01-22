import 'package:flutter/material.dart';

enum RequestStatusEnum { pending, fulfilled, cancelled }

extension RequestStatusEnumExtension on RequestStatusEnum {
  String get title {
    switch (this) {
      case RequestStatusEnum.pending:
        return "pending";
      case RequestStatusEnum.fulfilled:
        return "fulfilled";
      case RequestStatusEnum.cancelled:
        return "cancelled";
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
