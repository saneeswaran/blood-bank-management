import 'dart:developer';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/widgets/custom_icon_button.dart';
import 'package:blood_bank/core/widgets/custom_search_form_field.dart';
import 'package:blood_bank/features/home%20page/util/home_page_ui.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:blood_bank/features/home%20page/view%20model/update_location_manager.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    final showLocationDialog = ref.watch(askLocationUpdateRequestNotifier);

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
          onUpdate: () async {},
        );
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
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
    //get location and convert to address
    final currentLatlong = await LocationUtil.getCurrentLatLong();
    currentLatlong.fold(
      (error) {
        log(error);
        customSnackBar(context: context, content: error, type: SnackType.error);
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
              },
            );
          },
        );
      },
    );
  }
}
