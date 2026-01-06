import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/util/styles.dart';
import 'package:blood_bank/core/widgets/custom_text_form_field.dart';
import 'package:blood_bank/features/home%20page/compoments/blood_wrap_container.dart';
import 'package:flutter/material.dart';

class RequestDonor extends StatefulWidget {
  const RequestDonor({super.key});

  @override
  State<RequestDonor> createState() => _RequestDonorState();
}

class _RequestDonorState extends State<RequestDonor> {
  final patientNameController = TextEditingController();
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
              const Text(
                "Select Blood Group ",
                style: Styles.requestDonorTitle,
              ),
              const BloodWrapContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
