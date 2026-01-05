import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void navigateWithRightAndLeft({
  required BuildContext context,
  required Widget route,
}) {
  Navigator.push(
    context,
    PageTransition(
      duration: const Duration(milliseconds: 600),
      type: PageTransitionType.rightToLeft,
      child: route,
    ),
  );
}

void navigateWithScale({required BuildContext context, required Widget route}) {
  Navigator.push(
    context,
    PageTransition(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 600),
      type: PageTransitionType.scale,
      child: route,
    ),
  );
}

void navigateTo({required BuildContext context, required Widget route}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

void navigateBack(BuildContext context) {
  Navigator.pop(context);
}

void navigateWithReplacement({
  required BuildContext context,
  required Widget route,
}) {
  Navigator.pushReplacement(
    context,
    PageTransition(
      type: PageTransitionType.rightToLeft,
      duration: const Duration(milliseconds: 300),
      child: route,
    ),
  );
}

void navigateBottomToUp({
  required BuildContext context,
  required Widget route,
}) {
  Navigator.push(
    context,
    PageTransition(
      type: PageTransitionType.bottomToTop,
      duration: const Duration(milliseconds: 600),
      child: route,
    ),
  );
}
