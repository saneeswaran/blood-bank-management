import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/enum/blood_groud_enum.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BloodWrapContainer extends ConsumerWidget {
  const BloodWrapContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBlood = ref.watch(RequestController.selectedBloodGroup);
    return Wrap(
      children: List.generate(BloodGroudEnum.values.length, (index) {
        final bloods = BloodGroudEnum.values[index].title;
        final isSelected = selectedBlood == bloods;
        return GestureDetector(
          onTap: () =>
              ref.read(RequestController.selectedBloodGroup.notifier).state =
                  bloods,
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Appthemes.primaryColor : Colors.transparent,
                width: 1.2,
              ),
              color: isSelected ? Colors.white : Appthemes.lightGrey,
            ),
            child: Center(
              child: Text(
                bloods,
                style: TextStyle(
                  color: isSelected ? Appthemes.primaryColor : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
