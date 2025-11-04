import 'package:json_annotation/json_annotation.dart';

part 'create_product_response.g.dart';

@JsonSerializable(ignoreUnannotated: false)
class CreateProductResponse {
  final String name;
  @JsonKey(name: 'product_category_id')
  final int? productCategoryId;
  final String? sku;
  final String? description;
  final String? image;
  // Prices come as strings from API
  final String? price;
  final String? cost;
  @JsonKey(name: 'tax_rate')
  final String? taxRate;
  final int? quantity;
  final String? barcode;
  final String? unit;
  @JsonKey(name: 'has_tax')
  final bool? hasTax;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'track_inventory')
  final bool? trackInventory;
  final String? status;
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;
  // Ignore nested company object
  @JsonKey(includeFromJson: false, includeToJson: false)
  final dynamic company;

  CreateProductResponse({
    required this.name,
    this.productCategoryId,
    this.sku,
    this.description,
    this.image,
    this.price,
    this.cost,
    this.taxRate,
    this.quantity,
    this.barcode,
    this.unit,
    this.hasTax,
    this.isActive,
    this.trackInventory,
    this.status,
    this.companyId,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.company,
  });

  factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductResponseToJson(this);
}
