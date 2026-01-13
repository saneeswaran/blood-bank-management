import 'dart:developer';

import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final bloodRequestsNotifier =
    StateNotifierProvider<BloodRequestsNotifier, AsyncValue>(
      (ref) => BloodRequestsNotifier()..fetchRequests(),
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

  Future<void> changeRequestStatus({
    required String requestId,
    required String status,
  }) async {
    final List<BloodRequest> oldData = state.maybeWhen(
      orElse: () => [],
      data: (data) => data,
    );
    final selectedRequest = oldData.firstWhere(
      (element) => element.requestId == requestId,
    );
    try {
      final newData = oldData.map((e) {
        if (e.requestId == selectedRequest.requestId) {
          return selectedRequest.copyWith(status: status);
        } else {
          return e;
        }
      }).toList();

      state = AsyncValue.data(newData);
    } catch (e) {
      state = AsyncError(e.toString(), StackTrace.current);
    }
  }
}
