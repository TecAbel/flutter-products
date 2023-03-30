import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:products_login/models/index.dart';
import 'package:http/http.dart' as http;

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'products-fc281-default-rtdb.firebaseio.com';
  List<Product> products = [];
  bool isLoading = false;

  ProductService() {
    getProducts();
  }

  Future<List<Product>> getProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach((key, value) {
      final productTmp = Product.fromJson(value);
      productTmp.id = key;
      products.add(productTmp);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }
}
