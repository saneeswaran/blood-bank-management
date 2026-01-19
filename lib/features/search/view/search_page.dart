import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/enum/blood_groud_enum.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedBloodGroup;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              /// Title
              const Text("Select Blood Group", style: Styles.requestDonorTitle),

              const SizedBox(height: 20),

              /// Blood Group Chips
              Wrap(
                spacing: 8,
                runSpacing: 8,

                children: BloodGroudEnum.values.map((bloodEnum) {
                  final blood = bloodEnum.title;
                  final isSelected = selectedBloodGroup == blood;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBloodGroup = blood;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? Appthemes.primaryColor
                              : Colors.transparent,
                          width: 1.2,
                        ),
                        color: isSelected ? Colors.white : Appthemes.lightGrey,
                      ),
                      child: Center(
                        child: Text(
                          blood,
                          style: TextStyle(
                            color: isSelected
                                ? Appthemes.primaryColor
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
