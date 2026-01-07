import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String labelText;
  final bool showBorder;
  final String? hintText;
  final String? Function(T?)? validator;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.labelText,
    this.value,
    this.showBorder = false,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final border = showBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade300),
          )
        : UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          );

    return DropdownButtonFormField<T>(
      items: items,
      value: value,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: border,
        enabledBorder: border,
        focusedBorder: border,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }
}
