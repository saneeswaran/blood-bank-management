import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/util/date_util.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:flutter/material.dart';

class RequestItem extends StatelessWidget {
  final BloodRequest request;

  const RequestItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: Appthemes.primaryColor,
                child: Text(
                  request.bloodGroup,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.patientName?.isNotEmpty == true
                          ? request.patientName!
                          : 'Anonymous Patient',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      request.hospitalName,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              _StatusChip(status: request.status),
            ],
          ),

          const SizedBox(height: 12),

          _InfoRow(Icons.bloodtype, '${request.units} units'),
          _InfoRow(Icons.phone, request.contactPhone),
          _InfoRow(
            Icons.priority_high,
            request.urgency,
            color: _urgencyColor(request.urgency),
          ),
          _InfoRow(
            Icons.calendar_today,
            DateUtil.formatDateStringToString(request.createdAt),
          ),

          if (request.location.isNotEmpty)
            _InfoRow(
              Icons.location_on,
              request.location['fullAddress'] ?? 'Location',
            ),
        ],
      ),
    );
  }

  Color _urgencyColor(String urgency) {
    switch (urgency.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;

  const _InfoRow(this.icon, this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color ?? Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: color ?? Colors.grey.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      'active' => Colors.orange,
      'fulfilled' => Colors.green,
      'cancelled' => Colors.red,
      _ => Colors.grey,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
