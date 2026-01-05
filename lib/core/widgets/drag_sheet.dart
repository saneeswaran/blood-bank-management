import 'package:flutter/material.dart';

class DragSheet extends StatelessWidget {
  final Widget Function(ScrollController scrollController) builder;
  final bool expand;
  final double? initialChildSize;
  final double? maxChildSize;
  final double? minChildSize;
  const DragSheet({
    super.key,
    this.expand = false,
    required this.builder,
    this.initialChildSize = 0.7,
    this.maxChildSize,
    this.minChildSize,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize ?? 0.7,
      minChildSize: 0.4,
      maxChildSize: 1.0,
      expand: expand,
      builder: (context, scrollController) {
        return builder(scrollController);
      },
    );
  }
}
