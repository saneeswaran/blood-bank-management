import 'package:blood_bank/core/constants/app_images.dart';

class OnboardModel {
  final String image;
  final String title;
  final String description;

  const OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardModel> onboardData = const [
  OnboardModel(
    image: AppImages.onboard1,
    title: "Life-Saving\nConnections",
    description:
        "Connect with verified blood donors instantly in emergencies. Your lifeline when every second counts.",
  ),
  OnboardModel(
    image: AppImages.onboard2,
    title: "Smart Blood\nType Matching",
    description:
        "Our intelligent system finds perfect donor matches based on blood type compatibility and location.",
  ),
  OnboardModel(
    image: AppImages.onboard3,
    title: "Real-Time Donor\nNetwork",
    description:
        "Access active donors 24/7 with live availability status and instant connection capabilities.",
  ),
  OnboardModel(
    image: AppImages.onboard1,
    title: "Join RedFlow\nCommunity",
    description:
        "Become part of a network that has saved over 10,000 lives. Your contribution matters.",
  ),
];
