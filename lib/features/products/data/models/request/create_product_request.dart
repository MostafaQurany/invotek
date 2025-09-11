import 'package:json_annotation/json_annotation.dart';

part 'create_product_request.g.dart';

@JsonSerializable()
class CreateProductRequest {
  final String name;
  final String? description;
  final String price;
  final String? cost;
  final int quantity;
  final String? sku;
  final String? barcode;
  final String? unit;
  @JsonKey(name: 'tax_rate')
  final String? taxRate;
  final String? notes;
  final String? brand;
  final String? model;
  final String? weight;
  final String? dimensions;
  final String? color;
  final String? material;
  @JsonKey(name: 'min_quantity')
  final int? minQuantity;
  @JsonKey(name: 'max_quantity')
  final int? maxQuantity;
  @JsonKey(name: 'is_active')
  final bool isActive;
  @JsonKey(name: 'has_tax')
  final bool hasTax;
  @JsonKey(name: 'track_inventory')
  final bool trackInventory;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'product_category_id')
  final int? categoryId;

  CreateProductRequest({
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

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}
