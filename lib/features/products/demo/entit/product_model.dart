import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String name;
  final String? description;
  final double price;
  final double? costPrice;
  final int quantity;
  final String? sku;
  final String? barcode;
  final String category;
  final String status;
  final String? image;
  final String? unit;
  final double? taxRate;
  final String? notes;
  final String createdAt;
  final String updatedAt;
  final String? brand;
  final String? model;
  final double? weight;
  final String? dimensions;
  final String? color;
  final String? material;
  final int? minQuantity;
  final int? maxQuantity;
  final bool isActive;

  const Product({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.costPrice,
    required this.quantity,
    this.sku,
    this.barcode,
    required this.category,
    required this.status,
    this.image,
    this.unit,
    this.taxRate,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.brand,
    this.model,
    this.weight,
    this.dimensions,
    this.color,
    this.material,
    this.minQuantity,
    this.maxQuantity,
    required this.isActive,
  });

  Product copyWith({
    int? id,
    String? name,
    String? description,
    double? price,
    double? costPrice,
    int? quantity,
    String? sku,
    String? barcode,
    String? category,
    String? status,
    String? image,
    String? unit,
    double? taxRate,
    String? notes,
    String? createdAt,
    String? updatedAt,
    String? brand,
    String? model,
    double? weight,
    String? dimensions,
    String? color,
    String? material,
    int? minQuantity,
    int? maxQuantity,
    bool? isActive,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      costPrice: costPrice ?? this.costPrice,
      quantity: quantity ?? this.quantity,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      category: category ?? this.category,
      status: status ?? this.status,
      image: image ?? this.image,
      unit: unit ?? this.unit,
      taxRate: taxRate ?? this.taxRate,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      color: color ?? this.color,
      material: material ?? this.material,
      minQuantity: minQuantity ?? this.minQuantity,
      maxQuantity: maxQuantity ?? this.maxQuantity,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  @override
  String toString() {
    return 'Product(id: $id, name: $name, price: $price, quantity: $quantity, category: $category, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
