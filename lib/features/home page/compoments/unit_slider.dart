// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blood_bank/core/animations/highlightable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';

class UnitSlider extends ConsumerWidget {
  final GlobalKey globalKey;
  final bool highlight;
  const UnitSlider({
    super.key,
    required this.globalKey,
    required this.highlight,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(RequestController.selectedUnit);
    return RepaintBoundary(
      child: Highlightable(
        key: globalKey,
        highlight: highlight,
        child: Slider(
          value: unit,
          activeColor: Appthemes.primaryColor,
          max: 3,
          thumbColor: Colors.white,
          overlayColor: WidgetStateProperty.all(
            Appthemes.primaryColor.withOpacity(0.2),
          ),
          divisions: 3,
          label: unit.toString(),
          onChanged: (value) {
            ref.read(RequestController.selectedUnit.notifier).state = value;
          },
        ),
      ),
    );
  }
}
