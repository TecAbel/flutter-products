import 'package:flutter/material.dart';

class AuthTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.red,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: const Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
