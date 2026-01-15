import 'package:blood_bank/features/home%20page/view/home_page.dart';
import 'package:blood_bank/features/notification/view/notification_page.dart';
import 'package:blood_bank/features/profile/view/profile_page.dart';
import 'package:flutter_animated_navkit/animated_bottom_navkit.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

List<BottomNavItem> bottomBarItems = [
  BottomNavItem(icon: Iconsax.home, label: "Home", widget: const HomePage()),
  BottomNavItem(
    icon: Iconsax.notification,
    label: "Map",
    widget: const NotificationPage(),
  ),
  BottomNavItem(
    icon: Iconsax.notification,
    label: "Notification",
    widget: const NotificationPage(),
  ),
  BottomNavItem(
    icon: Iconsax.personalcard,
    label: "Profile",
    widget: const ProfilePage(),
  ),
];
