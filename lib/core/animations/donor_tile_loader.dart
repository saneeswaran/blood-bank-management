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
                        const SizedBox(height: 12),

                        // Bottom Section
                      ],
                    ),
                  ),
                ],
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
            border: Border.all(color: Colors.white, width: 2),
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
}
