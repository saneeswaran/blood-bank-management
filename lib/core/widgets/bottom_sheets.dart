import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showBottomSheet({required BuildContext context, required Widget child}) {
  showCupertinoModalBottomSheet(context: context, builder: (context) => child);
}
