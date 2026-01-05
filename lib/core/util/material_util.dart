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
          child: const Center(child: _FullScreenLoaderContent()),
        );
      },
    );
  }
}

class _FullScreenLoaderContent extends StatelessWidget {
  const _FullScreenLoaderContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [Loader(color: Appthemes.primaryColor)],
    );
  }
}
