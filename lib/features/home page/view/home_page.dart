import 'dart:developer';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_icon_button.dart';
import 'package:blood_bank/core/widgets/custom_search_form_field.dart';
import 'package:blood_bank/core/widgets/loader.dart';
import 'package:blood_bank/features/home%20page/util/home_page_ui.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:blood_bank/features/home%20page/service/update_location_manager.dart';
import 'package:blood_bank/features/home%20page/widgets/requset_tile.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:blood_bank/features/profile/view%20model/repo/profile_repo.dart';
import 'package:blood_bank/features/search/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _dialogShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(askLocationUpdateRequestNotifier.notifier).init();
      ref.read(bloodRequestsNotifier.notifier).fetchRequests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final showLocationDialog = ref.watch(askLocationUpdateRequestNotifier);
    final allRequests = ref.watch(bloodRequestsNotifier);
    if (showLocationDialog && !_dialogShown) {
      _dialogShown = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        HomePageUi.showLocationUpdateDialog(
          context: context,
          onSkip: () {
            ref
                .read(askLocationUpdateRequestNotifier.notifier)
                .saveTodayAsAsked();
            Navigator.pop(context);
          },
          onUpdate: () async {
            await updateLocation(context: context, ref: ref);
          },
        );
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      navigateTo(context: context, route: const SearchPage());
                    },
                    child: const Hero(
                      tag: "search",
                      child: AbsorbPointer(child: CustomSearchFormField()),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  icon: const Icon(Icons.filter, color: Colors.white),
                  onPressed: () {
                    navigateTo(
                      context: context,
                      route: const SearchPage(isFilter: true),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Requstions", style: Styles.requestDonorTitle),

            allRequests.when(
              data: (requests) {
                log(requests.length.toString());
                if (requests.isEmpty) {
                  return const Center(child: Text("No requests found"));
                }
                return ListView.builder(
                  itemCount: requests.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final request = requests[index];
                    return RequsetTile(bloodRequest: request);
                  },
                );
              },
              error: (error, st) => Text(error.toString()),
              loading: () => const Loader(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateLocation({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final notifier = ref.read(updateLocationLoader.notifier);
    // show loader
    notifier.state = true;
    MaterialUtil.showFullScreenLoader(context);
    final locationResult = await LocationUtil.askLocationPermission();

    locationResult.fold(
      (error) {
        Navigator.pop(context);
        log(error);
        customSnackBar(context: context, content: error, type: SnackType.error);
      },
      (access) async {
        final currentLatlong = await LocationUtil.getCurrentLatLong();
        currentLatlong.fold(
          (error) {
            log(error);
            customSnackBar(
              context: context,
              content: error,
              type: SnackType.error,
            );
            Navigator.pop(context);
          },
          (latlng) async {
            final addressData = await LocationUtil.getCurrentLocation(latlng);

            addressData.fold(
              (error) {
                log(error);
                customSnackBar(
                  context: context,
                  content: error,
                  type: SnackType.error,
                );
                Navigator.pop(context);
              },
              (address) async {
                final result = await ProfileRepo.changeLocationData(
                  locationData: address.toJson(),
                );

                result.fold(
                  (error) {
                    log(error);
                    customSnackBar(
                      context: context,
                      content: error,
                      type: SnackType.error,
                    );
                    Navigator.pop(context);
                  },
                  (success) {
                    customSnackBar(
                      context: context,
                      content: "Location Updated Successfully",
                      type: SnackType.success,
                    );
                    //update local
                    ref
                        .read(askLocationUpdateRequestNotifier.notifier)
                        .saveTodayAsAsked();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                );
              },
            );
          },
        );
      },
    );
    //get location and convert to address
  }
}
