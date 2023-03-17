import 'package:flutter/material.dart';
import 'package:products_login/forms/product_form.dart';

import '../widgets/index.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              decoration: _buildBoxDecoration(),
              width: double.infinity,
              height: 600,
              child: Column(
                children: const [TopImageProductDetail(), ProductForm()],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {},
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7),
          ),
        ],
      );
}
