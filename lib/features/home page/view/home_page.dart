import 'dart:developer';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/features/home%20page/util/home_page_ui.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:blood_bank/features/home%20page/service/update_location_manager.dart';
import 'package:blood_bank/features/home%20page/view/all_requests.dart';
import 'package:blood_bank/features/home%20page/widgets/search_header_delegate.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:blood_bank/features/profile/view%20model/repo/profile_repo_impl.dart';
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
      ref.read(bloodRequestsNotifier.notifier).fetchInitial();
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
          onUpdate: () async {
            await updateLocation(context: context, ref: ref);
          },
        );
      });
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Sticky Search Bar
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchHeaderDelegate(),
          ),

          // Section Title
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text("Requests", style: Styles.requestDonorTitle),
            ),
          ),

          // All Requests list (sliver)
          const AllRequests(),
        ],
      ),
    );
  }
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
          notifier.state = false;
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
              notifier.state = false;
              log(error);
              customSnackBar(
                context: context,
                content: error,
                type: SnackType.error,
              );
              Navigator.pop(context);
            },
            (address) async {
              final result = await ProfileRepoImpl().changeLocationData(
                locationData: address.toJson(),
              );

              result.fold(
                (error) {
                  notifier.state = false;
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
                  notifier.state = false;
                },
              );
            },
          );
        },
      );
    },
  );
}
