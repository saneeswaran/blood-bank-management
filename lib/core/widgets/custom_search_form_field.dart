import 'package:flutter/material.dart';

class CustomSearchFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final Widget? suffixIcon;
  const CustomSearchFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        focusNode: focusNode,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
          suffixIcon: suffixIcon,
          hintText: "Search here...",
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
