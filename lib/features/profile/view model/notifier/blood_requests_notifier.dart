import 'dart:developer';

import 'package:blood_bank/features/profile/view%20model/repo/blood_request_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final bloodRequestsNotifier =
    StateNotifierProvider<BloodRequestsNotifier, AsyncValue>(
      (ref) => BloodRequestsNotifier(),
    );

class BloodRequestsNotifier extends StateNotifier<AsyncValue> {
  BloodRequestsNotifier() : super(const AsyncValue.data([]));

  Future<void> fetchRequests() async {
    try {
      state = const AsyncLoading();
      final result = await BloodRequestRepo.fetchBloodrequests();

      result.fold(
        (error) {
          log(error);
          state = AsyncValue.error(error, StackTrace.current);
        },
        (requests) {
          state = AsyncValue.data(requests);
        },
      );
    } catch (e, st) {
      state = AsyncValue.error(e.toString(), st);
    }
  }
}
