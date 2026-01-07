import 'dart:developer';

import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/home%20page/compoments/blood_wrap_container.dart';
import 'package:blood_bank/features/home%20page/compoments/gender_and_date.dart';
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
              Consumer(
                builder: (context, ref, child) {
                  final selectedLoc = ref.watch(
                    RequestController.selectedLocation,
                  );

                  if (selectedLoc == null) {
                    return const SizedBox.shrink();
                  }

                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                        border: Border.all(color: Colors.green, width: 1.5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Header
                          const Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.green),
                              SizedBox(width: 8),
                              Text(
                                "Selected Location",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 12),
                          const Divider(),

                          if (selectedLoc.streetName.isNotEmpty)
                            _locationRow(
                              icon: Icons.home,
                              label: "Street",
                              value: selectedLoc.streetName,
                            ),
                          if (selectedLoc.streetName.isNotEmpty)
                            _locationRow(
                              icon: Icons.location_city,
                              label: "City",
                              value: selectedLoc.city,
                            ),
                          if (selectedLoc.streetName.isNotEmpty)
                            _locationRow(
                              icon: Icons.map,
                              label: "State",
                              value: selectedLoc.state,
                            ),
                          if (selectedLoc.streetName.isNotEmpty)
                            _locationRow(
                              icon: Icons.markunread_mailbox,
                              label: "Pincode",
                              value: selectedLoc.pincode.toString(),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const GenderAndDate(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 10),
          Text("$label:", style: const TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.grey[800]),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
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
      statusNotifier.state = "Fetching Current Location";
      notifier.state = true;

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
              customSnackBar(
                context: context,
                content: "Location Fetched Successfully",
                type: SnackType.success,
              );
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
