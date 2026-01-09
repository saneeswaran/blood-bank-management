import 'package:blood_bank/features/profile/view%20model/profile_repo.dart';
import 'package:blood_bank/features/search/model/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileData = FutureProvider<UserModel?>((ref) async {
  return ProfileRepo.fetchCurrentUserData();
});

final changeDonorStatus = FutureProvider.family.autoDispose<void, bool>((
  ref,
  isDonor,
) async {
  return ProfileRepo.changeDonorStatus(isDonor: isDonor);
});
