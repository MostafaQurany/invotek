import 'package:json_annotation/json_annotation.dart';

part 'create_product_response.g.dart';

@JsonSerializable()
class CreateProductResponse {
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
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'product_category_id')
  final int? categoryId;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;
  final String? image;

  CreateProductResponse({
    required this.description,
    required this.cost,
    required this.sku,
    required this.barcode,
    required this.unit,
    required this.taxRate,
    required this.notes,
    required this.brand,
    required this.model,
    required this.weight,
    required this.dimensions,
    required this.color,
    required this.material,
    required this.minQuantity,
    required this.maxQuantity,
    required this.isActive,
    required this.hasTax,
    required this.trackInventory,
    required this.status,
    required this.categoryId,
    required this.name,
    required this.price,
    required this.quantity,
    required this.companyId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.image,
  });

  factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductResponseToJson(this);
}
