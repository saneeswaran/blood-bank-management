import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/constants/navigation.dart';
import 'package:blood_bank/core/enum/blood_groud_enum.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/home%20page/model/location/location.dart';
import 'package:blood_bank/features/home%20page/util/location_util.dart';
import 'package:blood_bank/features/search/view/search_result_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? selectedBloodGroup;
  Location? selectedLocation;
  bool loader = false;

  void changeState(bool value) {
    setState(() {
      loader = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),

              /// Title
              const Text("Select Blood Group", style: Styles.requestDonorTitle),

              /// Blood Group Chips
              Wrap(
                spacing: 8,
                runSpacing: 8,

                children: BloodGroudEnum.values.map((bloodEnum) {
                  final blood = bloodEnum.title;
                  final isSelected = selectedBloodGroup == blood;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedBloodGroup = blood;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? Appthemes.primaryColor
                              : Colors.transparent,
                          width: 1.2,
                        ),
                        color: isSelected ? Colors.white : Appthemes.lightGrey,
                      ),
                      child: Center(
                        child: Text(
                          blood,
                          style: TextStyle(
                            color: isSelected
                                ? Appthemes.primaryColor
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const Text("Location", style: Styles.requestDonorTitle),

              GestureDetector(
                onTap: loader
                    ? null
                    : () async {
                        await fetchCurrentLocation(context);
                      },
                child: RepaintBoundary(
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
              if (selectedLocation != null)
                Center(
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

                        if (selectedLocation!.streetName.isNotEmpty)
                          _locationRow(
                            icon: Icons.home,
                            label: "Street",
                            value: selectedLocation!.streetName,
                          ),
                        if (selectedLocation!.streetName.isNotEmpty)
                          _locationRow(
                            icon: Icons.location_city,
                            label: "City",
                            value: selectedLocation!.city,
                          ),
                        if (selectedLocation!.streetName.isNotEmpty)
                          _locationRow(
                            icon: Icons.map,
                            label: "State",
                            value: selectedLocation!.state,
                          ),
                        if (selectedLocation!.streetName.isNotEmpty)
                          _locationRow(
                            icon: Icons.markunread_mailbox,
                            label: "Pincode",
                            value: selectedLocation!.pincode.toString(),
                          ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Center(
                child: CustomElevatedButton(
                  onPressed: () {
                    submitREquest();
                  },
                  text: "Search Donor",
                  minSize: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchCurrentLocation(BuildContext context) async {
    await LocationUtil.askLocationPermission();
    try {
      changeState(true);

      //show the loader
      if (!context.mounted) return;
      MaterialUtil.showFullScreenLoader(context);

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
              changeState(false);
              setState(() {
                selectedLocation = location;
              });
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
      changeState(false);
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

  void submitREquest() {
    if (selectedBloodGroup == null) {
      customSnackBar(
        context: context,
        content: "Please select blood group",
        type: SnackType.error,
      );
      return;
    }

    if (selectedLocation == null) {
      customSnackBar(
        context: context,
        content: "Please select location",
        type: SnackType.error,
      );
      return;
    }
    navigateTo(
      context: context,
      route: SearchResultPage(
        bloodGroup: selectedBloodGroup!,
        location: selectedLocation!.toJson(),
      ),
    );
  }
}
