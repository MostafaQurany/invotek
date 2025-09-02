import 'package:json_annotation/json_annotation.dart';

part 'update_product_request.g.dart';

@JsonSerializable()
class UpdateProductRequest {
  final String name;
  final String? description;
  final String price;
  final String? cost;
  final int quantity;
  final String? sku;
  final String? barcode;
  final String? unit;
  final String? taxRate;
  final String? notes;
  final String? brand;
  final String? model;
  final String? weight;
  final String? dimensions;
  final String? color;
  final String? material;
  final int? minQuantity;
  final int? maxQuantity;
  final bool isActive;
  final bool hasTax;
  final bool trackInventory;
  final String status;
  final int? categoryId;

  UpdateProductRequest({
    required this.name,
    this.description,
    required this.price,
    this.cost,
    required this.quantity,
    this.sku,
    this.barcode,
    this.unit,
    this.taxRate,
    this.notes,
    this.brand,
    this.model,
    this.weight,
    this.dimensions,
    this.color,
    this.material,
    this.minQuantity,
    this.maxQuantity,
    this.isActive = true,
    this.hasTax = false,
    this.trackInventory = false,
    this.status = 'active',
    this.categoryId,
  });

  factory UpdateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductRequestToJson(this);
}
