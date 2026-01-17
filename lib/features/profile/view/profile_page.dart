import 'package:blood_bank/core/constants/app_images.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/features/auth/service/auth_service.dart';
import 'package:blood_bank/features/profile/components/donate_switch.dart';
import 'package:blood_bank/features/profile/components/edit_profile_page.dart';
import 'package:blood_bank/features/profile/components/profile_tile.dart';
import 'package:blood_bank/features/profile/model/state/user_state.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/profile_notifier.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                Consumer(
                  builder: (context, ref, child) {
                    final image = ref.watch(
                      profileNotifier.select(
                        (value) => value.maybeWhen(
                          orElse: () => null,
                          loaded: (user) => user?.image,
                          error: (error) => null,
                        ),
                      ),
                    );
                    return CircleAvatar(
                      radius: 60,
                      backgroundImage: image != null && image.isNotEmpty
                          ? CachedNetworkImageProvider(image)
                          : const AssetImage(AppImages.noProfileImage),
                    );
                  },
                ),

                const SizedBox(height: 15),

                // User name
                const Text(
                  "Sundalman",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 30),

                const DonateSwitch(),

                // Tiles
                ProfileTile(
                  title: "Edit Profile",
                  icon: Icons.person,
                  onTap: () {},
                ),
                ProfileTile(
                  title: "Blood request",
                  icon: Icons.bloodtype,
                  onTap: () {},
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final userState = ref.watch(profileNotifier);
                    final userData = userState.maybeWhen(
                      orElse: () => null,
                      loaded: (user) => user,
                      error: (error) => null,
                    );
                    return ProfileTile(
                      title: "Settings",
                      icon: Icons.settings,
                      onTap: () {
                        navigateTo(
                          context: context,
                          route: EditProfilePage(userProfile: userData!),
                        );
                      },
                    );
                  },
                ),
                ProfileTile(
                  title: "Invite Friends",
                  icon: Icons.share,
                  onTap: () {},
                ),
                ProfileTile(
                  title: "Privacy Policy",
                  icon: Icons.privacy_tip,
                  onTap: () {},
                ),
                ProfileTile(
                  title: "Terms and Conditions",
                  icon: Icons.policy,
                  onTap: () {},
                ),
                ProfileTile(title: "About Us", icon: Icons.info, onTap: () {}),
                ProfileTile(
                  title: "Logout",
                  icon: Icons.logout,
                  onTap: () async {
                    await AuthService.signOut();
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
