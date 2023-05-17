import 'package:flutter/material.dart';
import 'package:products_login/forms/product_form.dart';
import 'package:products_login/models/product.dart';
import 'package:products_login/providers/product_form_provider.dart';
import 'package:products_login/services/index.dart';
import 'package:provider/provider.dart';

import '../widgets/index.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProductFormProvider(product),
      // child: _productScreenBody(context, product),
      builder: (context, child) => _productScreenBody(context, product),
    );
  }

  Scaffold _productScreenBody(BuildContext context, Product product) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final productService = Provider.of<ProductService>(context);
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
                  const ProductForm()
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: productService.isSaving
            ? null
            : () {
                final isValid = productForm.validate();
                if (!isValid) return;
                productService.saveOrCreateProduct(productForm.product);
              },
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
