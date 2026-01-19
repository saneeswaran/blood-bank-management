import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:flutter/material.dart';

class RequestTile extends StatelessWidget {
  final BloodRequest bloodRequest;
  final VoidCallback onAccept;
  final VoidCallback onContact;

  const RequestTile({
    super.key,
    required this.bloodRequest,
    required this.onAccept,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: Blood group and urgency
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Blood group
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Appthemes.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red[100]!),
                ),
                child: Text(
                  bloodRequest.bloodGroup,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Appthemes.primaryColor,
                  ),
                ),
              ),

              // Urgency badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Appthemes.primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  bloodRequest.urgency.toUpperCase(),
                  style: const TextStyle(
                    color: Appthemes.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Patient/Hospital info
          if (bloodRequest.patientName != null &&
              bloodRequest.patientName!.isNotEmpty)
            Text(
              bloodRequest.patientName!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

          const SizedBox(height: 4),

          Text(
            bloodRequest.hospitalName,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),

          const SizedBox(height: 8),

          // Details row
          Row(
            children: [
              // Units needed
              _buildDetailChip(
                icon: Icons.bloodtype,
                text:
                    '${bloodRequest.units} Unit${bloodRequest.units > 1 ? 's' : ''}',
              ),

              const SizedBox(width: 12),

              // Contact
              _buildDetailChip(
                icon: Icons.phone,
                text: bloodRequest.contactPhone,
              ),

              const SizedBox(width: 12),

              // Status
            ],
          ),

          const SizedBox(height: 8),
          _buildDetailChip(icon: Icons.info, text: bloodRequest.status),

          const SizedBox(height: 5),

          // Location and requested by
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  '${bloodRequest.location['fullAddress'] ?? ''}',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Buttons row
          //TODO : make invisible he accept and contact is the requested by is equal to same user
          Row(
            children: [
              // Accept button
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onAccept,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appthemes.primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: const Icon(Icons.check, size: 20),
                  label: const Text('Accept Request'),
                ),
              ),

              const SizedBox(width: 12),

              // Contact button
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onContact,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  icon: const Icon(Icons.phone, size: 20, color: Colors.blue),
                  label: const Text(
                    'Contact',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailChip({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
