import 'dart:developer';

import 'package:blood_bank/core/widgets/custom_icon_button.dart';
import 'package:blood_bank/core/widgets/custom_search_form_field.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final bool isFilter;
  const SearchPage({super.key, this.isFilter = false});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    isFocus();
  }

  void isFocus() {
    widget.isFilter ? focusNode.unfocus() : focusNode.requestFocus();
  }

  @override
  void dispose() {
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: CustomSearchFormField(
                      controller: searchController,
                      focusNode: focusNode,
                      onSubmitted: (value) {
                        log(value);
                      },
                    ),
                  ),
                  CustomIconButton(
                    icon: const Icon(Icons.filter, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
