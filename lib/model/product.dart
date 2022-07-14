import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  final String name;
  final String description;
  final String category;
  final double quantity;
  final double price;
  final List<String> images;
  String? id;
  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.quantity,
    required this.price,
    required this.images,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'category': category,
      'quantity': quantity,
      'price': price,
      'images': images,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      quantity: map['quantity'] ?? '',
      price: map['price'] ?? 0.0,
      images: List<String>.from(map['images']),
      id: map['_id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
