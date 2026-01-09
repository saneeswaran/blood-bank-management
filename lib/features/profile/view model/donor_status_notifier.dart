import 'package:blood_bank/features/profile/view%20model/profile_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'profile_repo.dart';

final donorStatusNotifierProvider =
    AsyncNotifierProvider<DonorStatusNotifier, void>(DonorStatusNotifier.new);

class DonorStatusNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> change(bool isDonor) async {
    state = const AsyncLoading();
    try {
      await ProfileRepo.changeDonorStatus(isDonor: isDonor);
      ref.invalidate(profileData);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
