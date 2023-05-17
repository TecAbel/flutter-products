import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:products_login/models/index.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = 'users-service-10a0b-default-rtdb.firebaseio.com';
  final String _cloudUrl = 'api.cloudinary.com';
  List<Product> products = [];
  bool isLoading = false;
  bool isSaving = false;
  Product? productSelected;
  File? selectedImage;

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
    if (selectedImage != null) {
      final imgUrl = await uploadToCloud();
      product.image = imgUrl;
    }
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

  Future<String?> uploadToCloud() async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_cloudUrl, '/v1_1/tecabel/image/upload',
        {'upload_preset': 'ml_default'});

    final uploadRequest = http.MultipartRequest('POST', url);
    if (selectedImage == null || selectedImage?.path == null) return null;
    final upload =
        await http.MultipartFile.fromPath('file', selectedImage!.path);

    uploadRequest.files.add(upload);

    final resp = await http.Response.fromStream(await uploadRequest.send());
    if (resp.statusCode != 200) {
      isSaving = false;
      notifyListeners();
      return null;
    }

    final bodyResp = cloudinaryResponseFromJson(resp.body);
    isSaving = false;
    notifyListeners();
    return bodyResp.secureUrl;
  }

  void updateProductImage(String path) {
    productSelected?.image = path;
    selectedImage = File.fromUri(Uri(path: path));
    notifyListeners();
  }
}
