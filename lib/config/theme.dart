import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primaryColor = Colors.indigo;
  static const Color enphasis = Colors.deepPurple;
  static ThemeData light = ThemeData.light().copyWith(
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: primaryColor,
      barBackgroundColor: primaryColor,
    ),
    primaryColor: Colors.indigo,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryColor),
    scaffoldBackgroundColor: Colors.grey[400],
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: primaryColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: enphasis, width: 2),
      ),
    ),
  );
  static ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.indigo,
    cupertinoOverrideTheme: const CupertinoThemeData(
      primaryColor: primaryColor,
      barBackgroundColor: primaryColor,
    ),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: primaryColor),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: primaryColor),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: enphasis, width: 2),
      ),
    ),
  );
}
