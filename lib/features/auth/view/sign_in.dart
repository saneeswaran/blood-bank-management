import 'package:blood_bank/core/animations/highlightable.dart';
import 'package:blood_bank/core/constants/app_images.dart';
import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/core/widgets/custom_rounded_button.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/auth/service/auth_service.dart';
import 'package:blood_bank/features/auth/view/forgot_password.dart';
import 'package:blood_bank/features/bottom%20nav/view/bottom_navi.dart';
import 'package:blood_bank/features/home%20page/controller/request_controller.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final _locationKey = GlobalKey();
  final _locationHighlight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                const SizedBox(height: 30),
                const Text(
                  "Sign in to continue",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Enter your email and password to sign in",
                  style: TextStyle(color: Appthemes.mediaiuGrey),
                ),

                const Text("Email", style: Styles.requestDonorTitle),
                AutofillGroup(
                  child: CustomTextFormField(
                    controller: emailController,
                    autofillHints: [AutofillHints.email],
                    labelText: "Email",
                  ),
                ),
                const Text("Password", style: Styles.requestDonorTitle),
                AutofillGroup(
                  child: CustomTextFormField(
                    controller: passwordController,
                    labelText: "Password",
                    autofillHints: [AutofillHints.password],
                  ),
                ),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      navigateTo(
                        context: context,
                        route: const ForgotPassword(),
                      );
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Appthemes.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Center(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final loader = ref.watch(authSignInLoader);
                      return CustomElevatedButton(
                        onPressed: () async {
                          await signInSubmit(context, ref);
                        },
                        isLoading: loader,
                        text: "Login",
                        minSize: true,
                      );
                    },
                  ),
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
                      "Don't have an account? ",
                      style: TextStyle(color: Appthemes.mediaiuGrey),
                    ),
                    TextButton(
                      onPressed: () {
                        navigateBack(context);
                      },
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

  Future<void> signInSubmit(BuildContext context, WidgetRef ref) async {
    final isValid = formKey.currentState!.validate();
    final notifier = ref.read(authSignInLoader.notifier);
    if (!isValid) return;
    final location = ref.watch(RequestController.selectedLocation);
    if (location == null) {
      customSnackBar(
        context: context,
        content: "Please update your location",
        type: SnackType.info,
      );
      return;
    }
    try {
      notifier.state = true;
      final result = await AuthService.loginWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!context.mounted) return;
      if (result != null) {
        notifier.state = true;
        navigateTo(context: context, route: const BottomNavi());
      }
    } catch (e) {
      notifier.state = true;
      customSnackBar(
        context: context,
        content: e.toString(),
        type: SnackType.error,
      );
    }
  }
}
