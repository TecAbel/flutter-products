import 'package:flutter/material.dart';
import 'package:products_login/models/product.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  Product product;
  ProductFormProvider(this.product);

  void updateProductAvailability(bool value) {
    product.available = value;
    notifyListeners();
  }

  bool validate() {
    return key.currentState?.validate() ?? false;
  }
}
