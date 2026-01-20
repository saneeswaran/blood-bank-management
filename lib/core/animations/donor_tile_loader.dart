import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/widgets/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DonorTileLoader extends StatelessWidget {
  const DonorTileLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[200]!, width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Avatar with Status Badge
                    _buildProfileSection(),
                    const SizedBox(width: 16),

                    // Main Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name and Blood Group Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // ignore: prefer_const_constructors
                              Text(
                                "user.name",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              _buildBloodGroupChip(),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Email
                          const Text(
                            "user.email",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),

                          // Vital Stats
                          _buildVitalStats(),
                          const SizedBox(height: 12),

                          // Bottom Section
                          _buildBottomSection(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[100],
            border: Border.all(color: Appthemes.primaryColor, width: 2),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: "user.image!",
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              placeholder: (context, url) => const Loader(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBloodGroupChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Appthemes.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Appthemes.primaryColor.withOpacity(0.3)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.bloodtype, size: 14, color: Appthemes.primaryColor),
          SizedBox(width: 4),
          Text(
            " user.bloodGroup",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Appthemes.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVitalStats() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildVitalStatItem(
            icon: Icons.person_outline,
            value: "user.age?.toString() ?? '--'",
            label: 'Age',
          ),
          Container(height: 20, width: 1, color: Colors.grey[300]),
          _buildVitalStatItem(
            icon: Icons.monitor_weight_outlined,
            value: "user.weight?.toStringAsFixed(1) ?? '--'",
            label: 'Weight',
            unit: 'kg',
          ),
          Container(height: 20, width: 1, color: Colors.grey[300]),
          _buildVitalStatItem(
            icon: Icons.height_outlined,
            value: "toUpperCase() ?? '--'",
            label: 'Gender',
          ),
        ],
      ),
    );
  }

  Widget _buildVitalStatItem({
    required IconData icon,
    required String value,
    required String label,
    String unit = '',
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: Colors.grey[600]),
            const SizedBox(width: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  if (unit.isNotEmpty)
                    TextSpan(
                      text: ' $unit',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Phone Number
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.phone_outlined,
                size: 14,
                color: Colors.blue[700],
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              '+{user.phone}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),

        // Donation Status and Info
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    size: 12,
                    color: Colors.orange[700],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "_formatDateCompact(user.lastDonationDate!)",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Colors.orange[700],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_outline,
                    size: 12,
                    color: Colors.red[700],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '{user.donationCount ?? 0}',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.red[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
