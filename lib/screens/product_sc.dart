import 'package:flutter/material.dart';
import 'package:products_login/forms/product_form.dart';
import 'package:products_login/models/product.dart';
import 'package:products_login/providers/product_form_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/index.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProductFormProvider(product),
      child: _productScreenBody(product),
    );
  }

  Scaffold _productScreenBody(Product product) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              decoration: _buildBoxDecoration(),
              width: double.infinity,
              height: 600,
              child: Column(
                children: [
                  TopImageProductDetail(
                    imageUrl: product.image,
                  ),
                  const Opacity(opacity: 0.9, child: ProductForm())
                ],
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
