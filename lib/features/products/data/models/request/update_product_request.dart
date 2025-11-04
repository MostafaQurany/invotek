import 'package:json_annotation/json_annotation.dart';

part 'update_product_request.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateProductRequest {
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

  UpdateProductRequest({
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

  factory UpdateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductRequestToJson(this);
}
