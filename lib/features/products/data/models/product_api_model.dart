import 'package:json_annotation/json_annotation.dart';

part 'product_api_model.g.dart';

@JsonSerializable()
class ProductApiModel {
  final int id;
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'product_category_id')
  final int? productCategoryId;
  final String? name;
  final String? sku;
  final String? description;
  final String? price;
  final String? cost;
  @JsonKey(name: 'tax_rate')
  final String? taxRate;
  @JsonKey(name: 'tax_rate_backup')
  final String? taxRateBackup;
  final int? quantity;
  @JsonKey(name: 'quantity_backup')
  final int? quantityBackup;
  final String? barcode;
  final String? unit;
  @JsonKey(name: 'has_tax')
  final bool? hasTax;
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @JsonKey(name: 'track_inventory')
  final bool? trackInventory;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final String? image;

  

  ProductApiModel({
    required this.id,
    this.companyId,
    this.productCategoryId,
    this.name,
    this.sku,
    this.description,
    this.price,
    this.cost,
    this.taxRate,
    this.taxRateBackup,
    this.quantity,
    this.quantityBackup,
    this.barcode,
    this.unit,
    this.hasTax,
    this.isActive,
    this.trackInventory,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductApiModelToJson(this);
}
