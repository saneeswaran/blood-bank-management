import 'package:flutter_riverpod/legacy.dart';

class RequestController {
  static final selectedBloodGround = StateProvider.autoDispose<String?>(
    (ref) => null,
  );
}
