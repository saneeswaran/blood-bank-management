import 'package:blood_bank/core/animations/donor_tile_loader.dart';
import 'package:flutter/material.dart';

class ListOfDonorLoader extends StatelessWidget {
  const ListOfDonorLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(8, (index) => const DonorTileLoader());
    return SingleChildScrollView(child: Column(children: items));
  }
}
