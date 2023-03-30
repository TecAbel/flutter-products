import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CupertinoNavigationBar(
          middle: Text(
        'Products',
        style: TextStyle(color: Colors.white),
      )),
      body: Center(
          child: CircularProgressIndicator(color: CustomTheme.primaryColor)),
    );
  }
}
