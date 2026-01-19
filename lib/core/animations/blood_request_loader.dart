import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BloodRequestLoader extends StatelessWidget {
  const BloodRequestLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Material(
        color: Colors.white,
        child: Container(
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "bloodRequest.bloodGroup",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Patient/Hospital info
              const Text(
                "bloodRequest.patientName!",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 4),

              const Text(
                "bloodRequest.hospitalName",
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              const SizedBox(height: 8),

              // Details row
              _buildDetailChip(
                icon: Icons.bloodtype,
                text: "'{bloodRequest.units}",
              ),

              const SizedBox(height: 8),
              _buildDetailChip(icon: Icons.info, text: "bloodRequest.status"),

              const SizedBox(height: 5),

              // Location and requested by
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '{bloodRequest.location['
                      '] ?? '
                      '}',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Buttons row
              Row(
                children: [
                  // Accept button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
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
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Contact',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
