import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:products_login/models/index.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'users-service-10a0b-default-rtdb.firebaseio.com';
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
    print('response => ${jsonEncode(resp.body)}');
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
