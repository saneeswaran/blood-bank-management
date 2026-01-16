import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_impl.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final bloodRequestRepoProvider = Provider<BloodRequestRepo>((ref) {
  return BloodRequestImpl();
});

final bloodRequestsNotifier =
    StateNotifierProvider<
      BloodRequestsNotifier,
      AsyncValue<List<BloodRequest>>
    >((ref) {
      final repo = ref.read(bloodRequestRepoProvider);
      return BloodRequestsNotifier(repo)..fetchRequests();
    });

class BloodRequestsNotifier
    extends StateNotifier<AsyncValue<List<BloodRequest>>> {
  final BloodRequestRepo _repo;

  BloodRequestsNotifier(this._repo) : super(const AsyncValue.data([]));

  Future<void> fetchRequests() async {
    state = const AsyncLoading();

    final result = await _repo.fetchBloodrequests();

    result.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
      (requests) {
        state = AsyncValue.data(requests);
      },
    );
  }

  Future<void> changeRequestStatus({
    required String requestId,
    required String status,
  }) async {
    final oldData = state.maybeWhen(
      data: (data) => data,
      orElse: () => <BloodRequest>[],
    );

    try {
      final newData = oldData.map((e) {
        return e.requestId == requestId ? e.copyWith(status: status) : e;
      }).toList();

      state = AsyncValue.data(newData);

      await _repo.changeRequestStatus(requestId: requestId, status: status);
    } catch (e, st) {
      state = AsyncValue.error(e.toString(), st);
    }
  }
}
