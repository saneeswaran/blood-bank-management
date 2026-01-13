import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static String? formatDate(Timestamp? timestamp) {
    final format = DateFormat('yyyy-MM-dd').format(timestamp!.toDate());
    return format;
  }

  static String? formatTime(Timestamp? timestamp) {
    final format = DateFormat('hh:mm a').format(timestamp!.toDate());
    return format;
  }

  static String currentDate() {
    final monthInName = DateFormat.MMMM().format(DateTime.now());
    final day = DateFormat.d().format(DateTime.now());
    final formattedDate = '$monthInName $day';
    return formattedDate;
  }

  static String formatTimeWithDuration(String createdAt) {
    try {
      final date = DateTime.parse(createdAt);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inMinutes < 1) return 'Just now';
      if (difference.inHours < 1) return '${difference.inMinutes}m ago';
      if (difference.inDays < 1) return '${difference.inHours}h ago';
      if (difference.inDays < 7) return '${difference.inDays}d ago';
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (_) {
      return createdAt;
    }
  }

  static String formatDateStringToString(String date) {
    try {
      return DateFormat('MMM dd, yyyy').format(DateTime.parse(date));
    } catch (_) {
      return date;
    }
  }
}
