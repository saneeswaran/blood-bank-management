import 'package:blood_bank/features/profile/model/model/user_model.dart';
import 'package:blood_bank/features/response/model/model/accept_donation.dart';
import 'package:blood_bank/features/response/model/state/accept_donation_state.dart';
import 'package:blood_bank/features/response/view%20model/repo/accepted_donation_impl.dart';
import 'package:blood_bank/features/response/view%20model/repo/accepted_donation_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final acceptDonationImpl = Provider<AcceptedDonationImpl>(
  (ref) => AcceptedDonationImpl(),
);

final acceptDonationNotifier =
    StateNotifierProvider<AcceptDonationNotifier, AcceptDonationState>((ref) {
      final repo = ref.read(acceptDonationImpl);
      return AcceptDonationNotifier(repo);
    });

final fetchAcceptedUserDataNotifier = FutureProvider.autoDispose
    .family<List<UserModel>, List<String>>((ref, userIds) async {
      final repo = ref.read(acceptDonationImpl);
      return repo.fetchUserAcceptedDonation(userId: userIds);
    });

class AcceptDonationNotifier extends StateNotifier<AcceptDonationState> {
  final AcceptedDonationRepo repo;
  AcceptDonationNotifier(this.repo)
    : super(const AcceptDonationState.success([]));

  Future<void> fetchResponseDonation({
    required String donationRequestId,
  }) async {
    try {
      state = const AcceptDonationState.loading();
      final result = await repo.fetchResponseDonations(
        donationRequestId: donationRequestId,
      );

      result.fold(
        (error) {
          state = AcceptDonationState.error(error);
        },
        (success) {
          state = AcceptDonationState.success(success);
        },
      );
    } catch (e) {
      state = AcceptDonationState.error(e.toString());
    }
  }

  Future<void> changeAcceptedStatus({
    required String donationRequestId,
    required String acceptId,
    required String status,
  }) async {
    final List<AcceptDonation>? localData = state.maybeWhen(
      orElse: () => null,
      success: (data) => data,
    );
    try {
      final result = await repo.changeAcceptedStatus(
        donationRequestId: donationRequestId,
        acceptId: acceptId,
        status: status,
      );

      result.fold(
        (error) {
          state = AcceptDonationState.error(error);
        },
        (success) {
          final index = localData!.indexWhere((e) => e.acceptId == acceptId);

          final selectedData = localData[index];
          final updatedData = selectedData.copyWith(status: status);

          localData[index] = updatedData;

          state = AcceptDonationState.success(localData);
        },
      );
    } catch (e) {
      state = AcceptDonationState.error(e.toString());
    }
  }

  @override
  void dispose() {
    state = const AcceptDonationState.success([]);
    super.dispose();
  }
}
