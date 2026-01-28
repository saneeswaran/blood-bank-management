import 'package:blood_bank/core/animations/highlightable.dart';
import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/form_validator.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/home%20page/compoments/blood_wrap_container.dart';
import 'package:blood_bank/features/home%20page/compoments/gender_and_date.dart';
import 'package:blood_bank/features/home%20page/compoments/priority_container.dart';
import 'package:blood_bank/features/home%20page/compoments/unit_slider.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:blood_bank/features/home%20page/model/blood%20request/blood_request.dart';
import 'package:blood_bank/features/home%20page/service/blood_request_hive_manager.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:blood_bank/features/home%20page/view%20model/blood_repo_impl.dart';
import 'package:blood_bank/features/profile/view%20model/notifier/blood_requests_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final hospitalNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //scroll global keys
  final _unitKey = GlobalKey();
  final _bloodKey = GlobalKey();
  final _locationKey = GlobalKey();
  final _genderKey = GlobalKey();
  final _dateKey = GlobalKey();
  final _priorityKey = GlobalKey();
  final _mobileNumberKey = GlobalKey();
  final _hospitalNameKey = GlobalKey();

  bool _unitHighlight = false;
  bool _bloodHighlight = false;
  bool _locationHighlight = false;
  bool _genderHighlight = false;
  bool _dateHighlight = false;
  bool _priorityHighlight = false;

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    patientNameController.dispose();
    mobileNumberController.dispose();
    hospitalNameController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                const SizedBox(height: 30),
                const Text("Patient Name ", style: Styles.requestDonorTitle),
                CustomTextFormField(
                  controller: patientNameController,
                  labelText: "Patient Name",
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Appthemes.mediaiuGrey,
                  ),
                ),
                const Text("Hospital Name ", style: Styles.requestDonorTitle),
                Highlightable(
                  key: _hospitalNameKey,
                  highlight: _hospitalNameKey.currentContext != null,
                  child: CustomTextFormField(
                    controller: hospitalNameController,
                    labelText: "Hospital Name",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Appthemes.mediaiuGrey,
                    ),
                    validator: FormValidator.validateTextField(
                      text: "Hospital Name",
                    ),
                  ),
                ),

                //blood group
                const Text(
                  "Select Blood Group",
                  style: Styles.requestDonorTitle,
                ),
                BloodWrapContainer(
                  globalKey: _bloodKey,
                  highlight: _bloodHighlight,
                ),
                const Text("Select Unit", style: Styles.requestDonorTitle),
                UnitSlider(globalKey: _unitKey, highlight: _unitHighlight),
                const Text("Mobile Number", style: Styles.requestDonorTitle),
                Highlightable(
                  key: _mobileNumberKey,
                  child: CustomTextFormField(
                    controller: mobileNumberController,
                    labelText: "Mobile Number",
                    validator: FormValidator.validateMobileNumber(number: 10),
                    textInputType: TextInputType.number,
                    maxLength: 10,
                  ),
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
                      child: RepaintBoundary(
                        child: Highlightable(
                          key: _locationKey,
                          highlight: _locationHighlight,
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

                GenderAndDate(
                  globalKey: _genderKey,
                  dateKey: _dateKey,
                  genderHighlight: _genderHighlight,
                  dateHighlight: _dateHighlight,
                ),

                const Text("Select Priority", style: Styles.requestDonorTitle),
                PriorityContainer(
                  globalKey: _priorityKey,
                  highlight: _priorityHighlight,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final loader = ref.watch(
                      RequestController.submitFormLoader,
                    );
                    return Center(
                      child: CustomElevatedButton(
                        onPressed: loader
                            ? null
                            : () async {
                                await submit(context, ref);
                              },
                        text: "Submit",
                        isLoading: loader,
                        minSize: true,
                      ),
                    );
                  },
                ),
              ],
            ),
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
          navigateBack(context);
          customSnackBar(
            context: context,
            content: error,
            type: SnackType.error,
          );
        },
        (latlng) async {
          statusNotifier.state = "Converting to Address";
          final locationResult = await LocationUtil.getCurrentLocation(latlng);

          locationResult.fold(
            (error) {
              navigateBack(context);
              customSnackBar(
                context: context,
                content: error,
                type: SnackType.error,
              );
            },
            (location) {
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

  Future<void> submit(BuildContext context, WidgetRef ref) async {
    final loader = ref.read(RequestController.submitFormLoader.notifier);

    // Validate Form
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    // Get values
    final unit = ref.watch(RequestController.selectedUnit);
    final blood = ref.watch(RequestController.selectedBloodGroup);
    final location = ref.watch(RequestController.selectedLocation);
    final gender = ref.watch(RequestController.selectedGender);
    final date = ref.watch(RequestController.selectDate);
    final priority = ref.watch(RequestController.selectedPriority);

    // Validations list with keys & highlight setters
    final validations = [
      (
        unit == 0.0,
        "Please Select Unit",
        _unitKey,
        () => setState(() => _unitHighlight = true),
      ),
      (
        blood == null,
        "Please Select Blood Group",
        _bloodKey,
        () => setState(() => _bloodHighlight = true),
      ),
      (
        location == null,
        "Please Select Location",
        _locationKey,
        () => setState(() => _locationHighlight = true),
      ),
      (
        gender == null,
        "Please Select Gender",
        _genderKey,
        () => setState(() => _genderHighlight = true),
      ),
      (
        date == null,
        "Please Select Date",
        _dateKey,
        () => setState(() => _dateHighlight = true),
      ),
      (
        priority == null,
        "Please Select Priority",
        _priorityKey,
        () => setState(() => _priorityHighlight = true),
      ),
    ];

    // Iterate and handle first invalid field
    for (final (isInvalid, message, key, highlight) in validations) {
      if (isInvalid) {
        customSnackBar(
          context: context,
          content: message,
          type: SnackType.info,
        );

        // Scroll to the widget
        scrollTo(key);

        // Flash the widget
        highlight();
        return;
      }
    }

    final bloodData = BloodRequest(
      patientName: patientNameController.text,
      requestedBy: FirebaseAuth.instance.currentUser!.uid,
      bloodGroup: blood!,
      units: unit.toInt(),
      hospitalName: hospitalNameController.text,
      location: location!.toJson(),
      contactPhone: int.parse(mobileNumberController.text),
      urgency: priority!,
      status: "pending",
      createdAt: DateTime.now().toIso8601String(),
    );

    //  All valid -> submit
    loader.state = true;
    MaterialUtil.showFullScreenLoader(context);

    final result = await BloodRepoImpl().giveBloodRequst(
      bloodRequest: bloodData,
    );

    result.fold(
      (error) {
        loader.state = false;

        customSnackBar(context: context, content: error, type: SnackType.error);
      },
      (success) async {
        final localData = bloodData.copyWith(requestId: success);

        await BloodRequestHiveManager.addRequest(localData);
        ref.invalidate(bloodRequestsNotifier);
        loader.state = false;
        if (!context.mounted) return;

        customSnackBar(
          context: context,
          content: "Request Submitted Successfully",
          type: SnackType.success,
        );
        Navigator.pop(context);
      },
    );
    if (!context.mounted) return;
    Navigator.pop(context);
  }
}
