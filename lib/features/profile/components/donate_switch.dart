import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/features/profile/view%20model/donor_status_notifier.dart';
import 'package:blood_bank/features/profile/view%20model/profile_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DonateSwitch extends ConsumerStatefulWidget {
  const DonateSwitch({super.key});

  @override
  ConsumerState<DonateSwitch> createState() => _DonateSwitchState();
}

class _DonateSwitchState extends ConsumerState<DonateSwitch> {
  @override
  void initState() {
    super.initState();

    ref.listen<AsyncValue<void>>(donorStatusNotifierProvider, (prev, next) {
      if (next.isLoading) {
        MaterialUtil.showFullScreenLoader(context, message: "Updating status");
      } else if (prev?.isLoading == true) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final donorStatus = ref.watch(
      profileData.select((value) => value.value?.isDonor ?? false),
    );

    final isLoading = ref.watch(donorStatusNotifierProvider).isLoading;

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
          const Text("I want to Donate"),
          const Spacer(),
          Switch(
            value: donorStatus,
            activeColor: Colors.white,
            activeTrackColor: Appthemes.primaryColor,
            onChanged: isLoading
                ? null
                : (value) {
                    ref
                        .read(donorStatusNotifierProvider.notifier)
                        .change(value);
                  },
          ),
        ],
      ),
    );
  }
}
