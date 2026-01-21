import 'dart:developer';

import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:blood_bank/features/response/model/state/accept_donation_state.dart';
import 'package:blood_bank/features/response/view%20model/repo/response_blood_request.dart';
import 'package:blood_bank/features/response/view%20model/repo/response_blood_request_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final responseBloodRequestProvider = Provider<ResponseBloodRequestImpl>(
  (ref) => ResponseBloodRequestImpl(),
);

final responseBloodRequestNotifier =
    StateNotifierProvider<ResponseBloodRequestNotifier, AcceptDonationState>((
      ref,
    ) {
      final repo = ref.read(responseBloodRequestProvider);
      return ResponseBloodRequestNotifier(repo);
    });

class ResponseBloodRequestNotifier extends StateNotifier<AcceptDonationState> {
  final ResponseBloodRequest repo;
  ResponseBloodRequestNotifier(this.repo)
    : super(const AcceptDonationState.success([]));

  Future<void> fetchAllResponse({required String requestId}) async {
    try {
      state = const AcceptDonationState.loading();

      final result = await repo.fetchDonationRequests(requestId: requestId);

      result.fold(
        (error) {
          log("response blood request error $error");
          state = AcceptDonationState.error(error);
        },
        (data) {
          state = AcceptDonationState.success(data);
        },
      );
    } catch (e) {
      log("response blood request $e");
      state = AcceptDonationState.error(e.toString());
    }
  }

  Future<void> changeStatusOfRequest({
    required String requestId,
    required String status,
  }) async {
    final List<AcceptDonation>? localData = state.maybeWhen(
      orElse: () => null,
      success: (data) => data,
    );
    try {
      final result = await repo.changeStatusOfRequest(
        requestId: requestId,
        status: status,
      );

      result.fold(
        (error) {
          log("response blood request error $error");
          state = AcceptDonationState.error(error);
        },
        (success) {
          final newData = localData!
              .map(
                (e) => e.acceptId == requestId ? e.copyWith(status: status) : e,
              )
              .toList();
          state = AcceptDonationState.success(newData);
        },
      );
    } catch (e) {
      log("response blood request $e");
      state = AcceptDonationState.error(e.toString());
    }
  }
}
