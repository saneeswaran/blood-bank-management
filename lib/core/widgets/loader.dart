import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  final Color? color;
  final double? size;
  const Loader({super.key, this.color = Colors.white, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: color ?? Colors.white,
      size: size ?? 40,
    );
  }
}
