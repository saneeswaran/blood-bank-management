import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/article/view/article_page.dart';
import 'package:blood_bank/features/home%20page/view/home_page.dart';
import 'package:blood_bank/features/notification/view/notification_page.dart';
import 'package:blood_bank/features/profile/view/profile_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter_animated_navkit/animated_bottom_navkit.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

List<FlashyTabBarItem> bottomBarItems = [
  FlashyTabBarItem(
    icon: const Icon(Iconsax.home),
    title: const Text("Home"),
    activeColor: Appthemes.primaryColor,
    inactiveColor: Appthemes.grey,
  ),
  FlashyTabBarItem(
    icon: const Icon(Iconsax.image),
    title: const Text("Article"),
    activeColor: Appthemes.primaryColor,
    inactiveColor: Appthemes.grey,
  ),
  FlashyTabBarItem(
    icon: const Icon(Iconsax.notification),
    title: const Text("Notification"),
    activeColor: Appthemes.primaryColor,
    inactiveColor: Appthemes.grey,
  ),
  FlashyTabBarItem(
    icon: const Icon(Iconsax.personalcard),
    title: const Text("Profile"),
    activeColor: Appthemes.primaryColor,
    inactiveColor: Appthemes.grey,
  ),
];

final List<Widget> pages = const [
  HomePage(),
  ArticlePage(),
  NotificationPage(),
  ProfilePage(),
];
