import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/home%20page/view/home_page.dart';
import 'package:blood_bank/features/notification/view/notification_page.dart';
import 'package:blood_bank/features/placeholder/view/place_holder.dart';
import 'package:blood_bank/features/profile/view/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

List<BottomBarItem> bottomBarItems = [
  BottomBarItem(
    icon: const Icon(Iconsax.home),
    title: const Text("Home"),
    selectedColor: Appthemes.primaryColor,
    unSelectedColor: Appthemes.grey,
  ),
  BottomBarItem(
    icon: const Icon(Iconsax.notification),
    title: const Text("PlaceHolder"),
    selectedColor: Appthemes.primaryColor,
    unSelectedColor: Appthemes.grey,
  ),
  BottomBarItem(
    icon: const Icon(Iconsax.notification),
    title: const Text("Notification"),
    selectedColor: Appthemes.primaryColor,
    unSelectedColor: Appthemes.grey,
  ),
  BottomBarItem(
    icon: const Icon(Iconsax.personalcard),
    title: const Text("Profile"),
    selectedColor: Appthemes.primaryColor,
    unSelectedColor: Appthemes.grey,
  ),
];

List<Widget> pages = const [
  HomePage(),
  PlaceHolder(),
  NotificationPage(),
  ProfilePage(),
];
