import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/enum/priority_enum.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PriorityContainer extends ConsumerWidget {
  const PriorityContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(PriorityEnum.values.length, (index) {
        final priorities = PriorityEnum.values[index].title;
        final selected =
            ref.watch(RequestController.selectedPriority) == priorities;
        return GestureDetector(
          onTap: () {
            ref.read(RequestController.selectedPriority.notifier).state =
                priorities;
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? Appthemes.primaryColor : Colors.transparent,
                width: 1.2,
              ),
              color: selected ? Appthemes.primaryColor : Appthemes.lightGrey,
            ),
            child: Center(
              child: Text(
                priorities,
                style: TextStyle(
                  color: selected ? Colors.white : Colors.black,
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
