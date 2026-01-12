import 'package:blood_bank/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileTileModel {
  final String title;
  final IconData icon;
  final Function(BuildContext context) onTap;
  const ProfileTileModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
  static final List<ProfileTileModel> profileTiles = [
    ProfileTileModel(
      title: "Edit Profile",
      icon: Icons.person,
      onTap: (context) {},
    ),
    ProfileTileModel(
      title: "Blood request",
      icon: Icons.bloodtype,
      onTap: (context) {},
    ),
    ProfileTileModel(
      title: "Settings",
      icon: Icons.settings,
      onTap: (context) {},
    ),
    ProfileTileModel(
      title: "Invite Friends",
      icon: Icons.share,
      onTap: (context) {},
    ),
    ProfileTileModel(
      title: "Privacy Policy",
      icon: Icons.privacy_tip,
      onTap: (context) {},
    ),
    ProfileTileModel(
      title: "Terms and Conditions",
      icon: Icons.policy,
      onTap: (context) {},
    ),
    ProfileTileModel(title: "About Us", icon: Icons.info, onTap: (context) {}),
    ProfileTileModel(
      title: "Logout",
      icon: Icons.logout,
      onTap: (context) async {
        await AuthService.signOut();
      },
    ),
  ];
}
