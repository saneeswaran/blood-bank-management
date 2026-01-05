import 'package:blood_bank/core/widgets/custom_elevated_button.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddDonorForm extends StatefulWidget {
  const AddDonorForm({super.key});

  @override
  State<AddDonorForm> createState() => _AddDonorFormState();
}

class _AddDonorFormState extends State<AddDonorForm> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    dobController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              spacing: size.height * 0.02,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    "Become a Donor",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                // Center(
                //   child: GestureDetector(
                //     onTap: () {},
                //     child: Container(
                //       height: size.height * 0.20,
                //       width: size.width * 0.6,
                //       decoration: provider.imageFile == null
                //           ? const BoxDecoration(
                //               color: Appthemes.lightGrey,
                //               shape: BoxShape.circle,
                //             )
                //           : BoxDecoration(
                //               shape: BoxShape.circle,
                //               image: DecorationImage(
                //                 image: FileImage(provider.imageFile!),
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //       child: provider.imageFile == null
                //           ? const Center(
                //               child: Text(
                //                 "Please select\n your image",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.black,
                //                   fontSize: 14,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             )
                //           : null,
                //     ),
                //   ),
                // ),
                CustomTextFormField(
                  labelText: "Name",
                  controller: nameController,
                ),
                CustomTextFormField(
                  labelText: "Email",
                  controller: emailController,
                ),
                //  donorUI.dobPicker(controller: dobController),
                CustomTextFormField(
                  labelText: "+91 Phone Number",
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                ),
                //    donorUI.bloodType(),
                //  donorUI.cronicDisease(),
                //  donorUI.genderDropDown(),
                // _stateAndDiscrict(size: size),
                CustomTextFormField(
                  labelText: "Address",
                  controller: addressController,
                  maxLine: 5,
                ),
                Row(
                  children: [
                    //   donorUI.termsAndConditions(),
                    TextButton(
                      onPressed: () {
                        //  navigateTo(context, const TermsAndConditions());
                      },
                      child: const Text(
                        "Terms and Conditions",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 1,
                  child: CustomElevatedButton(
                    onPressed: () {
                      //  navigateTo(context, const LocationPickerScreen());
                    },

                    text: "Pick Location",
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * 0.07,
                  child: CustomElevatedButton(
                    onPressed: () async {},
                    isLoading: false,
                    text: "Submit",
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
