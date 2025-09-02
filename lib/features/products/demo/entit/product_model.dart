import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int? id;
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

  ProductModel({
    this.id,
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

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  // Copy with method for easy updates
  ProductModel copyWith({
    int? id,
    int? companyId,
    int? productCategoryId,
    String? name,
    String? sku,
    String? description,
    String? price,
    String? cost,
    String? taxRate,
    String? taxRateBackup,
    int? quantity,
    int? quantityBackup,
    String? barcode,
    String? unit,
    bool? hasTax,
    bool? isActive,
    bool? trackInventory,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? image,
  }) {
    return ProductModel(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      productCategoryId: productCategoryId ?? this.productCategoryId,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      description: description ?? this.description,
      price: price ?? this.price,
      cost: cost ?? this.cost,
      taxRate: taxRate ?? this.taxRate,
      taxRateBackup: taxRateBackup ?? this.taxRateBackup,
      quantity: quantity ?? this.quantity,
      quantityBackup: quantityBackup ?? this.quantityBackup,
      barcode: barcode ?? this.barcode,
      unit: unit ?? this.unit,
      hasTax: hasTax ?? this.hasTax,
      isActive: isActive ?? this.isActive,
      trackInventory: trackInventory ?? this.trackInventory,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      image: image ?? this.image,
    );
  }
}
