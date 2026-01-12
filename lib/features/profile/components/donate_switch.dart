import 'package:blood_bank/core/constants/appthemes.dart';
import 'package:blood_bank/core/util/custom_snack.dart';
import 'package:blood_bank/core/util/material_util.dart';
import 'package:blood_bank/core/widgets/loader.dart';
import 'package:blood_bank/features/profile/model/state/user_state.dart';
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
  Widget build(BuildContext context) {
    final notifier = ref.read(profileNotifier.notifier);
    final donorState = ref.watch(profileNotifier);
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
          donorState.when(
            initial: () => const Switch(value: false, onChanged: null),
            loading: () => const Loader(),
            loaded: (userData) {
              return Switch(
                value: userData?.isDonor ?? false,
                activeColor: Colors.white,
                activeTrackColor: Appthemes.primaryColor,
                onChanged: (value) async {
                  try {
                    MaterialUtil.showFullScreenLoader(
                      context,
                      message: "Updating...",
                    );
                    await notifier.changeDonorStatus(isDonor: value);
                    if (!context.mounted) return;
                    Navigator.pop(context);
                  } catch (e) {
                    Navigator.pop(context);
                    customSnackBar(
                      context: context,
                      content: e.toString(),
                      type: SnackType.error,
                    );
                  }
                },
              );
            },
            error: (error) => Text(error),
          ),
        ],
      ),
    );
  }
}
