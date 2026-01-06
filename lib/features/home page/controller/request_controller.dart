import 'package:blood_bank/features/home%20page/model/location/location.dart';
import 'package:flutter_riverpod/legacy.dart';

class RequestController {
  static final selectedBloodGround = StateProvider<String?>((ref) => null);

  static final selectedUnit = StateProvider<double>((ref) => 0.0);

  static final locationLoader = StateProvider.autoDispose<bool>((ref) => false);

  static final selectedLocation = StateProvider.autoDispose<Location?>(
    (ref) => null,
  );

  static final requestLoader = StateProvider.autoDispose<bool>((ref) => false);
}
