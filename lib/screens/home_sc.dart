import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_login/config/index.dart';
import 'package:products_login/models/product.dart';
import 'package:products_login/screens/index.dart';
import 'package:products_login/widgets/index.dart';
import 'package:provider/provider.dart';

import '../services/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    final products = productService.products;
    if (productService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: const CupertinoNavigationBar(
          middle: Text(
        'Productoss',
        style: TextStyle(color: Colors.white),
      )),
      body: products.isEmpty
          ? const Center(
              child: Text(
              'No hay productos para mostrar',
              style: TextStyle(color: CustomTheme.primaryColor, fontSize: 18),
            ))
          : ListView.builder(
              itemCount: productService.products.length,
              itemBuilder: (BuildContext ctx, i) => ProductCard(
                product: productService.products[i],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'product_detail',
              arguments: Product(
                name: '',
                available: true,
                image: '',
                price: 0,
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
