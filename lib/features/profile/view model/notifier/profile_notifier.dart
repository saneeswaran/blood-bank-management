import 'dart:developer';
import 'package:blood_bank/features/profile/model/state/user_state.dart';
import 'package:blood_bank/features/profile/view%20model/repo/profile_repo.dart';
import 'package:flutter_riverpod/legacy.dart';

final profileNotifier = StateNotifierProvider<ProfileNotifier, UserState>((
  ref,
) {
  return ProfileNotifier()..fetchUserData();
});

class ProfileNotifier extends StateNotifier<UserState> {
  ProfileNotifier() : super(const UserState.initial());

  Future<void> fetchUserData() async {
    try {
      state = const UserState.loading();
      final result = await ProfileRepo.fetchCurrentUserData();

      result?.fold((error) {
        log(error);
        return state = UserState.error(error);
      }, (userData) => state = UserState.loaded(userData));
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }

  Future<void> changeDonorStatus({required bool isDonor}) async {
    final user = state.maybeWhen(loaded: (user) => user, orElse: () => null);

    try {
      final result = await ProfileRepo.changeDonorStatus(isDonor: isDonor);

      result.fold(
        (error) {
          log(error);
          return state = UserState.error(error);
        },
        (_) {
          final updatedUser = user?.copyWith(isDonor: isDonor);
          state = UserState.loaded(updatedUser);
        },
      );
    } catch (e) {
      state = UserState.error(e.toString());
    }
  }
}
