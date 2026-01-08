import 'dart:developer' show log;

import 'package:blood_bank/core/animations/highlightable.dart';
import 'package:blood_bank/core/constants/app_images.dart';
import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/form_validator.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_check_box.dart';
import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/core/widgets/custom_rounded_button.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/auth/service/auth_service.dart';
import 'package:blood_bank/features/home%20page/compoments/blood_wrap_container.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:blood_bank/features/home%20page/model/location/location.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  Location? location;
  String? bloodGroup;
  bool isDonor = false;
  final formKey = GlobalKey<FormState>();

  //keys
  final _bloodKey = GlobalKey();
  final _locationKey = GlobalKey();
  final _bloodHighlight = false;
  final _locationHighlight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              crossAxisAlignment: .start,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const Text(
                  "Enter your details to sign up",
                  style: TextStyle(color: Appthemes.mediaiuGrey),
                ),

                //controller
                const Text("User Name", style: Styles.requestDonorTitle),
                CustomTextFormField(
                  controller: userNameController,
                  labelText: "User Name",
                  validator: FormValidator.validateTextField(text: "User Name"),
                ),
                const Text("Email ", style: Styles.requestDonorTitle),
                CustomTextFormField(
                  controller: emailController,
                  labelText: "Email",
                  validator: FormValidator.emailValidate(),
                ),
                const Text("Password ", style: Styles.requestDonorTitle),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: "Password",
                  validator: FormValidator.passwordValidate(number: 8),
                ),
                const Text(
                  "Select Blood Group ",
                  style: Styles.requestDonorTitle,
                ),
                BloodWrapContainer(
                  globalKey: _bloodKey,
                  highlight: _bloodHighlight,
                ),
                const Text("Location ", style: Styles.requestDonorTitle),
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

                Row(
                  children: [
                    CustomCheckBox(
                      value: isDonor,
                      onChanged: (newValue) {
                        setState(() {
                          isDonor = newValue!;
                        });
                      },
                    ),
                    const Text(
                      "Be a Donor",
                      style: TextStyle(
                        fontSize: 16,
                        color: Appthemes.mediaiuGrey,
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final loader = ref.watch(authSignUpLoader);
                    return Center(
                      child: CustomElevatedButton(
                        onPressed: loader
                            ? null
                            : () async {
                                await submitSignUp(context, ref);
                              },
                        text: "Sign Up",
                        minSize: true,
                      ),
                    );
                  },
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(color: Appthemes.mediaiuGrey),
                    ),

                    Text(" OR ", style: TextStyle(color: Colors.grey[700])),

                    const Expanded(
                      child: Divider(color: Appthemes.mediaiuGrey),
                    ),
                  ],
                ),

                Center(
                  child: CustomRoundedButton(
                    imagePath: AppImages.onboard1,
                    onTap: () {},
                  ),
                ),

                Row(
                  mainAxisAlignment: .center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Appthemes.mediaiuGrey),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Appthemes.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void highlight(bool value) => setState(() => value = !value);

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

  Future<void> submitSignUp(BuildContext context, WidgetRef ref) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    final notifier = ref.read(authSignUpLoader.notifier);

    //values
    final location = ref.watch(RequestController.selectedLocation);
    final bloodGroup = ref.watch(RequestController.selectedBloodGroup);

    if (location == null) {
      customSnackBar(
        context: context,
        content: "Please select a location",
        type: SnackType.error,
      );
      return;
    }

    if (bloodGroup == null) {
      customSnackBar(
        context: context,
        content: "Please select a blood group",
        type: SnackType.error,
      );
      return;
    }

    notifier.state = true;
    try {
      final result = await AuthService.registerWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        isDonor: isDonor,
        userName: userNameController.text,
      );

      if (result != null) {
        notifier.state = false;
        if (!context.mounted) return;
        navigateBack(context);
        customSnackBar(
          context: context,
          content: "Account Created Successfully",
          type: SnackType.success,
        );
      }
    } catch (e) {
      notifier.state = false;
      if (!context.mounted) return;
      customSnackBar(
        context: context,
        content: e.toString(),
        type: SnackType.error,
      );
    }
  }
}
