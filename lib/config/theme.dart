import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Colors.indigo;
  static const Color enphasis = Colors.deepPurple;
  static ThemeData light = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: primaryColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: enphasis, width: 2),
      ),
    ),
  );
  static ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: primaryColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: enphasis, width: 2),
      ),
    ),
  );
}
