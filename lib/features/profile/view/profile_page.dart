import 'package:blood_bank/core/constants/app_images.dart';
import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/profile/components/donate_switch.dart';
import 'package:blood_bank/features/profile/components/profile_tile.dart';
import 'package:blood_bank/features/profile/model/profile_tile_model.dart';
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
                /// PROFILE IMAGE
                const CircleAvatar(
                  radius: 65,
                  backgroundColor: Appthemes.primaryColor,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: CachedNetworkImageProvider(AppImages.logo),
                  ),
                ),

                const SizedBox(height: 15),

                /// USER NAME
                const Text(
                  "Sundalman",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                /// LIST TILES
                ListView.builder(
                  itemCount: ProfileTileModel.profileTiles.length + 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    /// DONATE SWITCH TILE
                    if (index == 0) {
                      return const DonateSwitch();
                    }

                    /// NORMAL PROFILE TILE
                    final tile = ProfileTileModel.profileTiles[index - 1];
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
