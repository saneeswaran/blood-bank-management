import 'package:blood_bank/core/widgets/custom_drop_down.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class GenderAndDate extends ConsumerWidget {
  const GenderAndDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(RequestController.selectedGender);
    final selectedDate = ref.watch(RequestController.selectDate);
    final dateController = ref.watch(RequestController.dateControllerProvider);

    final genders = ["Male", "Female", "Others"];

    // Sync date -> text field
    if (selectedDate != null) {
      dateController.text =
          "${selectedDate.day.toString().padLeft(2, '0')}-"
          "${selectedDate.month.toString().padLeft(2, '0')}-"
          "${selectedDate.year}";
    }

    return Row(
      children: [
        /// GENDER
        Expanded(
          child: ColumnDivider(
            title: 'Gender',
            widget: CustomDropDown<String>(
              value: gender,
              labelText: 'Gender',
              hintText: 'Select Gender',
              items: genders
                  .map(
                    (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                  )
                  .toList(),
              onChanged: (newValue) {
                ref.read(RequestController.selectedGender.notifier).state =
                    newValue;
              },
            ),
          ),
        ),

        const SizedBox(width: 10),

        /// DATE
        /// DATE
        Expanded(
          child: ColumnDivider(
            title: "Date of Birth",
            widget: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      content: SizedBox(
                        height: 350,
                        width: 300,
                        child: SfDateRangePicker(
                          selectionMode: DateRangePickerSelectionMode.single,
                          initialSelectedDate: selectedDate ?? DateTime(2000),
                          minDate: DateTime(1900),
                          maxDate: DateTime.now(),
                          onSelectionChanged:
                              (DateRangePickerSelectionChangedArgs args) {
                                final pickedDate = args.value as DateTime;

                                ref
                                        .read(
                                          RequestController.selectDate.notifier,
                                        )
                                        .state =
                                    pickedDate;

                                Navigator.pop(context);
                              },
                        ),
                      ),
                    );
                  },
                );
              },
              child: AbsorbPointer(
                child: CustomTextFormField(
                  labelText: "Select Date",
                  controller: dateController,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ColumnDivider extends StatelessWidget {
  final String title;
  final Widget widget;
  const ColumnDivider({super.key, required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        widget,
      ],
    );
  }
}
