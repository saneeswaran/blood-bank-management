import 'package:blood_bank/core/util/network_util.dart';
import 'package:blood_bank/features/home%20page/model/state/blood_requests_state.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_impl.dart';
import 'package:blood_bank/features/profile/view%20model/repo/blood_request_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final bloodRequestRepoProvider = Provider<BloodRequestRepo>((ref) {
  return BloodRequestImpl();
});
final bloodRequestsNotifier =
    StateNotifierProvider<BloodRequestsNotifier, BloodRequestsState>((ref) {
      final repo = ref.read(bloodRequestRepoProvider);
      return BloodRequestsNotifier(repo, ref)..fetchSafeWithLocal();
    });

class BloodRequestsNotifier extends StateNotifier<BloodRequestsState> {
  final BloodRequestRepo _repo;
  final Ref ref;

  BloodRequestsNotifier(this._repo, this.ref)
    : super(const BloodRequestsState());

  DocumentSnapshot? _lastDoc;
  static const int _pageSize = 10;

  void _setState(BloodRequestsState newState) {
    if (!mounted) return;
    state = newState;
  }

  Future<void> fetchSafeWithLocal() async {
    final connectionState = ref.watch(checkInternetConnection);

    connectionState.when(
      data: (isConnected) async {
        if (isConnected) {
          await fetchInitial();
        } else {
          loadHive();
        }
      },
      loading: () {
        loadHive();
      },
      error: (err, st) {
        loadHive();
      },
    );
  }

  void loadHive() {
    final data = BloodRequestHiveManager.getAllRequests();
    _setState(state.copyWith(requests: data));
  }

  Future<void> fetchInitial() async {
    _setState(
      state.copyWith(isLoading: true, error: null, requests: [], hasMore: true),
    );

    _lastDoc = null;

    final result = await _repo.fetchBloodrequests(limit: _pageSize);
    if (!mounted) return;
    result.fold(
      (error) {
        _setState(state.copyWith(isLoading: false, error: error));
      },
      (data) {
        _lastDoc = data.isNotEmpty ? data.last.snapshot : null;

        _setState(
          state.copyWith(
            isLoading: false,
            requests: data,
            hasMore: data.length == _pageSize,
          ),
        );
      },
    );
  }

  Future<void> fetchMore() async {
    if (state.isLoadingMore || !state.hasMore) return;

    _setState(state.copyWith(isLoadingMore: true));

    final result = await _repo.fetchBloodrequests(
      limit: _pageSize,
      lastDoc: _lastDoc,
    );
    if (!mounted) return;
    result.fold(
      (error) {
        _setState(state.copyWith(isLoadingMore: false, error: error));
      },
      (newData) {
        _lastDoc = newData.isNotEmpty ? newData.last.snapshot : _lastDoc;

        _setState(
          state.copyWith(
            isLoadingMore: false,
            hasMore: newData.length == _pageSize,
            requests: [...state.requests, ...newData],
          ),
        );
      },
    );
  }

  Future<void> changeRequestStatus({
    required String requestId,
    required String status,
  }) async {
    final updated = state.requests.map((e) {
      return e.requestId == requestId ? e.copyWith(status: status) : e;
    }).toList();

    state = state.copyWith(requests: updated);

    await _repo.changeRequestStatus(requestId: requestId, status: status);
  }
}
