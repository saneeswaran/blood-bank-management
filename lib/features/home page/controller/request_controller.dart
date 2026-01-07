import 'package:blood_bank/features/home%20page/model/location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class RequestController {
  static final selectedBloodGroup = StateProvider<String?>((ref) => null);

  static final selectedUnit = StateProvider<double>((ref) => 1.0);

  static final locationLoader = StateProvider.autoDispose<bool>((ref) => false);

  static final selectedLocation = StateProvider.autoDispose<Location?>(
    (ref) => null,
  );

  static final requestLoader = StateProvider.autoDispose<bool>((ref) => false);

  static final locationStatusMessage = StateProvider<String>((ref) => "");

  //gender

  static final selectedGender = StateProvider<String?>((ref) => null);

  static final selectDate = StateProvider<DateTime?>((ref) => null);

  static final dateControllerProvider =
      Provider.autoDispose<TextEditingController>((ref) {
        final controller = TextEditingController();
        ref.onDispose(controller.dispose);
        return controller;
      });

  //priority
  static final selectedPriority = StateProvider<String?>((ref) => null);

  //submit form
  static final submitFormLoader = StateProvider.autoDispose<bool>(
    (ref) => false,
  );
}
