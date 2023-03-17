import 'package:flutter/material.dart';

import '../widgets/index.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Container(
            decoration: _buildBoxDecoration(),
            height: 450,
            width: double.infinity,
            child: Column(
              children: const [
                TopImageProductDetail(),
                Text('Product detail'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      );
}
