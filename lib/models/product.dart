// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Map<String, Product> productsFromJson(String str) => Map.from(json.decode(str))
    .map((k, v) => MapEntry<String, Product>(k, Product.fromJson(v)));

String productsToJson(Map<String, Product> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Product {
  Product({
    required this.available,
    this.image,
    required this.name,
    required this.price,
  });

  bool available;
  String? image;
  String name;
  double price;
  String? id;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        available: json["available"],
        image: json["image"],
        name: json["name"],
        price: json["price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "image": image,
        "name": name,
        "price": price,
      };
}
