import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:flutter/material.dart';

class DonateSwitch extends StatefulWidget {
  const DonateSwitch({super.key});

  @override
  State<DonateSwitch> createState() => _DonateSwitchState();
}

class _DonateSwitchState extends State<DonateSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.bloodtype, color: Appthemes.primaryColor),
          const SizedBox(width: 15),
          const Text(
            "I want to Donate",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          Switch(
            value: false,
            activeColor: Colors.white,
            activeTrackColor: Appthemes.primaryColor,
            onChanged: (value) {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
