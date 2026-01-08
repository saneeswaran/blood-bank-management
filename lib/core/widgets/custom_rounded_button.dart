import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;
  const CustomRoundedButton({super.key, required this.imagePath, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Appthemes.lightGrey,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
