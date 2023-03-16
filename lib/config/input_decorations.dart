import 'package:flutter/material.dart';
import 'package:products_login/config/theme.dart';

class InputDecorations {
  static InputDecoration authInputDecoration(
      {String? label, String? hintText, IconData? iconData}) {
    return InputDecoration(
      label: label != null ? Text(label) : null,
      hintText: hintText,
      prefixIcon: iconData != null
          ? Icon(
              iconData,
              color: CustomTheme.primaryColor,
            )
          : null,
    );
  }
}
