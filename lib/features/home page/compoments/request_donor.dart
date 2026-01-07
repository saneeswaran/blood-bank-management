import 'dart:developer';

import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/home%20page/compoments/blood_wrap_container.dart';
import 'package:blood_bank/features/home%20page/compoments/unit_slider.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestDonor extends StatefulWidget {
  const RequestDonor({super.key});

  @override
  State<RequestDonor> createState() => _RequestDonorState();
}

class _RequestDonorState extends State<RequestDonor> {
  final patientNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Request Donor")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              const Text("Patient Name ", style: Styles.requestDonorTitle),
              CustomTextFormField(
                controller: patientNameController,
                labelText: "Patient Name",
                prefixIcon: const Icon(
                  Icons.person,
                  color: Appthemes.mediaiuGrey,
                ),
              ),

              //blood group
              const Text("Select Blood Group", style: Styles.requestDonorTitle),
              const BloodWrapContainer(),
              const Text("Select Unit", style: Styles.requestDonorTitle),
              const UnitSlider(),
              const Text("Mobile Number", style: Styles.requestDonorTitle),
              CustomTextFormField(
                controller: mobileNumberController,
                labelText: "Mobile Number",
              ),
              const Text("Select Location", style: Styles.requestDonorTitle),
              Consumer(
                builder: (context, ref, child) {
                  final loader = ref.watch(RequestController.locationLoader);
                  return GestureDetector(
                    onTap: loader
                        ? null
                        : () async {
                            await fetchCurrentLocation(ref, context);
                          },
                    child: AbsorbPointer(
                      absorbing: true,
                      child: CustomTextFormField(
                        controller: TextEditingController(),
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: Appthemes.mediaiuGrey,
                        ),
                        labelText: "Use Current Location",
                        suffixIcon: const Icon(
                          Icons.arrow_drop_down,
                          color: Appthemes.mediaiuGrey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchCurrentLocation(WidgetRef ref, BuildContext context) async {
    final notifier = ref.read(RequestController.locationLoader.notifier);
    final status = ref.watch(RequestController.locationStatusMessage);
    final statusNotifier = ref.read(
      RequestController.locationStatusMessage.notifier,
    );
    await LocationUtil.askLocationPermission();
    try {
      notifier.state = true;
      statusNotifier.state = "Fetching Current Location";

      //show the loader
      if (!context.mounted) return;
      MaterialUtil.showFullScreenLoader(context, message: status);

      final latlngResult = await LocationUtil.getCurrentLatLong();

      latlngResult.fold(
        (error) {
          log(error.toString());
          navigateBack(context);
          customSnackBar(
            context: context,
            content: error,
            type: SnackType.error,
          );
        },
        (latlng) async {
          statusNotifier.state = "Converting to Address";
          log(latlng.toString());
          final locationResult = await LocationUtil.getCurrentLocation(latlng);

          locationResult.fold(
            (error) {
              log(error.toString());
              navigateBack(context);
              customSnackBar(
                context: context,
                content: error,
                type: SnackType.error,
              );
            },
            (location) {
              log(location.toString());
              ref.read(RequestController.selectedLocation.notifier).state =
                  location;
              notifier.state = false;
              navigateBack(context);
            },
          );
        },
      );
    } catch (e) {
      log(e.toString());
      notifier.state = true;
      if (!context.mounted) return;
      navigateBack(context);
      customSnackBar(
        context: context,
        content: e.toString(),
        type: SnackType.error,
      );
    }
  }
}
