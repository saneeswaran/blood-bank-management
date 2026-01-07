import 'package:blood_bank/core/widgets/loader.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool minSize;
  final bool maxSize;
  final Color backgroundColor;
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.minSize = false,
    this.maxSize = false,
    this.backgroundColor = const Color(0xffe60449),
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: isLoading ? Colors.grey : backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
        side: const BorderSide(color: Colors.white),
        minimumSize: minSize ? Size(size.width * 0.8, 60) : const Size(0, 0),
        maximumSize: minSize ? Size(size.width * 0.8, 60) : const Size(0, 0),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const Loader()
          : Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
