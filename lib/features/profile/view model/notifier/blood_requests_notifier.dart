import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_impl.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      return BloodRequestsNotifier(repo)..fetchInitial();
    });

class BloodRequestsNotifier
    extends StateNotifier<AsyncValue<List<BloodRequest>>> {
  final BloodRequestRepo _repo;

  BloodRequestsNotifier(this._repo) : super(const AsyncValue.loading());

  DocumentSnapshot? _lastDoc;
  bool _hasMore = true;
  bool _isFetching = false;

  static const int _pageSize = 10;

  Future<void> fetchInitial() async {
    state = const AsyncLoading();
    _lastDoc = null;
    _hasMore = true;

    final result = await _repo.fetchBloodrequests(limit: _pageSize);

    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (data) {
        if (data.isNotEmpty) {
          _lastDoc = data.last.snapshot;
        }
        _hasMore = data.length == _pageSize;
        state = AsyncValue.data(data);
      },
    );
  }

  Future<void> fetchMore() async {
    if (!_hasMore || _isFetching) return;

    _isFetching = true;

    final oldData = state.value ?? [];

    final result = await _repo.fetchBloodrequests(
      limit: _pageSize,
      lastDoc: _lastDoc,
    );

    result.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
      (newData) {
        if (newData.isNotEmpty) {
          _lastDoc = newData.last.snapshot;
        }
        _hasMore = newData.length == _pageSize;

        state = AsyncValue.data([...oldData, ...newData]);
      },
    );

    _isFetching = false;
  }

  Future<void> changeRequestStatus({
    required String requestId,
    required String status,
  }) async {
    final oldData = state.value ?? [];

    final updated = oldData.map((e) {
      return e.requestId == requestId ? e.copyWith(status: status) : e;
    }).toList();

    state = AsyncValue.data(updated);

    await _repo.changeRequestStatus(requestId: requestId, status: status);
  }
}
