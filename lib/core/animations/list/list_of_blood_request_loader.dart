import 'package:blood_bank/core/animations/blood_request_loader.dart';
import 'package:flutter/material.dart';

class ListOfBloodRequestLoader extends StatelessWidget {
  const ListOfBloodRequestLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(5, (index) => const BloodRequestLoader());
    return Column(children: items);
  }
}
