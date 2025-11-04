import 'package:json_annotation/json_annotation.dart';

part 'create_product_request.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateProductRequest {
  final String name;
  @JsonKey(name: 'product_category_id')
  final int? productCategoryId;
  final String? sku;
  final String? description;
  final String? image;
  final double? price;
  final double? cost;
  @JsonKey(name: 'tax_rate')
  final double? taxRate;
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

  CreateProductRequest({
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
  });

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}
