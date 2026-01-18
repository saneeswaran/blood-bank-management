import 'dart:developer';

import 'package:blood_bank/core/constants/app_images.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/features/auth/service/auth_service.dart';
import 'package:blood_bank/features/home%20page/service/update_location_manager.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:blood_bank/features/profile/components/donate_switch.dart';
import 'package:blood_bank/features/profile/components/edit_profile_page.dart';
import 'package:blood_bank/features/profile/components/profile_tile.dart';
import 'package:blood_bank/features/profile/components/set_available.dart';
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

                const SetAvailable(),

                // Tiles
                Consumer(
                  builder: (context, ref, child) {
                    final userState = ref.watch(profileNotifier);
                    final userData = userState.maybeWhen(
                      orElse: () => null,
                      loaded: (user) => user,
                      error: (error) => null,
                    );
                    return ProfileTile(
                      title: "Edit Profile",
                      icon: Icons.person,
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
                  title: "Update Address",
                  icon: Icons.location_on,
                  onTap: () {},
                ),
                ProfileTile(
                  title: "Blood request",
                  icon: Icons.bloodtype,
                  onTap: () {},
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ProfileTile(
                      title: "Settings",
                      icon: Icons.settings,
                      onTap: () {},
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

  Future<void> updateLocation({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final notifier = ref.read(updateLocationLoader.notifier);
    final repo = ref.read(profileRepoImpl);
    // show loader
    notifier.state = true;
    MaterialUtil.showFullScreenLoader(context);
    final locationResult = await LocationUtil.askLocationPermission();

    locationResult.fold(
      (error) {
        Navigator.pop(context);
        log(error);
        customSnackBar(context: context, content: error, type: SnackType.error);
      },
      (access) async {
        final currentLatlong = await LocationUtil.getCurrentLatLong();
        currentLatlong.fold(
          (error) {
            notifier.state = false;
            log(error);
            customSnackBar(
              context: context,
              content: error,
              type: SnackType.error,
            );
            Navigator.pop(context);
          },
          (latlng) async {
            final addressData = await LocationUtil.getCurrentLocation(latlng);

            addressData.fold(
              (error) {
                notifier.state = false;
                log(error);
                customSnackBar(
                  context: context,
                  content: error,
                  type: SnackType.error,
                );
                Navigator.pop(context);
              },
              (address) async {
                final result = await repo.changeLocationData(
                  locationData: address.toJson(),
                );

                result.fold(
                  (error) {
                    notifier.state = false;
                    log(error);
                    customSnackBar(
                      context: context,
                      content: error,
                      type: SnackType.error,
                    );
                    Navigator.pop(context);
                  },
                  (success) {
                    customSnackBar(
                      context: context,
                      content: "Location Updated Successfully",
                      type: SnackType.success,
                    );

                    Navigator.pop(context);
                    Navigator.pop(context);
                    notifier.state = false;
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
