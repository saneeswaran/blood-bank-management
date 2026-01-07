import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/widgets/loader.dart';
import 'package:flutter/material.dart';

class MaterialUtil {
  static void showFullScreenLoader(BuildContext context, {String? message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: FullScreenLoaderContent(title: message ?? "Loading"),
          ),
        );
      },
    );
  }
}

class FullScreenLoaderContent extends StatelessWidget {
  final String title;
  const FullScreenLoaderContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Loader(color: Appthemes.primaryColor),
        const SizedBox(height: 20),
        SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Center(
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                key: ValueKey(title),
                animatedTexts: [
                  TyperAnimatedText(
                    title,
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 50),
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
