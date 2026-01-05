import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/widgets/custom_icon_button.dart';
import 'package:blood_bank/core/widgets/custom_search_form_field.dart';
import 'package:blood_bank/features/search/view/search_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(context: context, route: const SearchPage());
                      },
                      child: const Hero(
                        tag: "search",
                        child: AbsorbPointer(
                          absorbing: true,
                          child: CustomSearchFormField(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
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
