import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products_login/screens/index.dart';
import 'package:products_login/widgets/index.dart';
import 'package:provider/provider.dart';

import '../services/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: const CupertinoNavigationBar(
          middle: Text(
        'Productos',
        style: TextStyle(color: Colors.white),
      )),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext ctx, i) => ProductCard(
          product: productService.products[i],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hi');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
