// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

class Product {
  bool available;
  String? image;
  String name;
  double price;
  String? id;

  Product({
    required this.available,
    this.image,
    required this.name,
    required this.price,
  });

  Product copyWith({
    bool? available,
    String? image,
    String? name,
    double? price,
  }) =>
      Product(
        available: available ?? this.available,
        image: image ?? this.image,
        name: name ?? this.name,
        price: price ?? this.price,
      );

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
