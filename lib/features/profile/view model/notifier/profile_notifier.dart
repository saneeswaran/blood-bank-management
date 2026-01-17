import 'dart:developer';
import 'package:blood_bank/features/profile/model/state/user_state.dart';
import 'package:blood_bank/features/profile/view%20model/repo/profile_repo.dart';
import 'package:blood_bank/features/profile/view%20model/repo/profile_repo_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final profileRepoImpl = Provider<ProfileRepoImpl>((ref) {
  return ProfileRepoImpl();
});

final profileNotifier = StateNotifierProvider<ProfileNotifier, UserState>((
  ref,
) {
  final repo = ref.read(profileRepoImpl);
  return ProfileNotifier(repo);
});

class ProfileNotifier extends StateNotifier<UserState> {
  final ProfileRepo profileRepo;
  ProfileNotifier(this.profileRepo) : super(const UserState.initial());

  Future<void> fetchUserData() async {
    try {
      state = const UserState.loading();
      final result = await profileRepo.fetchCurrentUserData();

      result.fold((error) {
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
      final result = await profileRepo.changeDonorStatus(isDonor: isDonor);

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
