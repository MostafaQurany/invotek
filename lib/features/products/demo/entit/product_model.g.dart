// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  productCategoryId: (json['product_category_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  sku: json['sku'] as String?,
  description: json['description'] as String?,
  price: json['price'] as String?,
  cost: json['cost'] as String?,
  taxRate: json['tax_rate'] as String?,
  taxRateBackup: json['tax_rate_backup'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  quantityBackup: (json['quantity_backup'] as num?)?.toInt(),
  barcode: json['barcode'] as String?,
  unit: json['unit'] as String?,
  hasTax: json['has_tax'] as bool?,
  isActive: json['is_active'] as bool?,
  trackInventory: json['track_inventory'] as bool?,
  status: json['status'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  image: json['image'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'product_category_id': instance.productCategoryId,
      'name': instance.name,
      'sku': instance.sku,
      'description': instance.description,
      'price': instance.price,
      'cost': instance.cost,
      'tax_rate': instance.taxRate,
      'tax_rate_backup': instance.taxRateBackup,
      'quantity': instance.quantity,
      'quantity_backup': instance.quantityBackup,
      'barcode': instance.barcode,
      'unit': instance.unit,
      'has_tax': instance.hasTax,
      'is_active': instance.isActive,
      'track_inventory': instance.trackInventory,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'image': instance.image,
    };
