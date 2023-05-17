import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:products_login/models/index.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'users-service-10a0b-default-rtdb.firebaseio.com';
  List<Product> products = [];
  bool isLoading = false;
  bool isSaving = false;

  ProductService() {
    getProducts();
  }

  Future<List<Product>?> getProducts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);
    if (resp.statusCode != 200) {
      isLoading = false;
      notifyListeners();
      return null;
    }
    final Map<String, dynamic> productsMap = json.decode(resp.body);
    productsMap.forEach((key, value) {
      Product productTmp = Product.fromJson(value);
      productTmp.id = key;
      products.add(productTmp);
    });
    isLoading = false;
    notifyListeners();
    return products;
  }

  Future saveOrCreateProduct(Product product) async {
    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      // implement save
      await createProduct(product);
    } else {
      // implement update
      await updateProduct(product);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String?> updateProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products/${product.id}.json');
    final resp = await http.put(url, body: product.toRawJson());
    if (resp.statusCode != 200) {
      return null;
    }
    final indexProd = products.indexWhere((x) => x.id == product.id);
    products[indexProd] = product;
    return product.id;
  }

  Future<String?> createProduct(Product product) async {
    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.post(url, body: product.toRawJson());
    if (resp.statusCode != 200) {
      return null;
    }
    final mapped = json.decode(resp.body);
    product.id = mapped['name'];

    products.add(product);
    return product.id;
  }
}
