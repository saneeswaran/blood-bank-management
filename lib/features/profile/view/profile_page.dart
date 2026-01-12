import 'package:blood_bank/core/constants/app_images.dart';
import 'package:blood_bank/features/profile/components/donate_switch.dart';
import 'package:blood_bank/features/profile/components/profile_tile.dart';
import 'package:blood_bank/features/profile/model/model/profile_tile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isDonor = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Profile image
                const CircleAvatar(
                  radius: 65,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(AppImages.logo),
                  ),
                ),

                const SizedBox(height: 15),

                // User name
                const Text(
                  "Sundalman",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                // Tiles
                ListView.builder(
                  itemCount: ProfileTileModel.profileTiles.length + 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // Normal profile tile
                    final tile = ProfileTileModel.profileTiles[index - 1];

                    if (index == 0) {
                      return const DonateSwitch();
                    }
                    return ProfileTile(
                      icon: tile.icon,
                      title: tile.title,
                      onTap: () => tile.onTap(context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
