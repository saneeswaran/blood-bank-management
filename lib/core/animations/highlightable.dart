import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:flutter/material.dart';

class Highlightable extends StatefulWidget {
  final Widget child;
  final bool highlight;
  final Duration duration;
  const Highlightable({
    super.key,
    required this.child,
    this.highlight = false,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<Highlightable> createState() => _HighlightableState();
}

class _HighlightableState extends State<Highlightable> {
  bool _highlight = false;

  @override
  void didUpdateWidget(covariant Highlightable oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.highlight && !_highlight) {
      _highlight = true;
      Future.delayed(widget.duration, () {
        if (mounted) {
          setState(() => _highlight = false);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _highlight
              ? Appthemes.primaryColor.withOpacity(0.5)
              : Colors.transparent,
          width: 2,
        ),
      ),

      child: widget.child,
    );
  }
}
