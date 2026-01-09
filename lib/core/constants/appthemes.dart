import 'package:flutter/material.dart';

class Appthemes {
  static const Color primaryColor = Color(0xffe60449);
  static const Color scaffoldBackgroundColor = Color(0xffffffff);
  static const Color grey = Color(0xffdedede);
  static const Color mediaiuGrey = Color(0xffb6b6b6);
  static const Color lightGrey = Color(0xfff6f6f6);

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      //  backgroundColor: scaffoldBackgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
