import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UnitSlider extends ConsumerWidget {
  const UnitSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unit = ref.watch(RequestController.selectedUnit);
    return Slider(
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
    );
  }
}
