// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductResponse _$CreateProductResponseFromJson(
  Map<String, dynamic> json,
) => CreateProductResponse(
  name: json['name'] as String,
  productCategoryId: (json['product_category_id'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  price: json['price'] as String?,
  cost: json['cost'] as String?,
  taxRate: json['tax_rate'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  barcode: json['barcode'] as String?,
  unit: json['unit'] as String?,
  hasTax: json['has_tax'] as bool?,
  isActive: json['is_active'] as bool?,
  trackInventory: json['track_inventory'] as bool?,
  status: json['status'] as String?,
  companyId: (json['company_id'] as num?)?.toInt(),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateProductResponseToJson(
  CreateProductResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'product_category_id': instance.productCategoryId,
  'sku': instance.sku,
  'description': instance.description,
  'image': instance.image,
  'price': instance.price,
  'cost': instance.cost,
  'tax_rate': instance.taxRate,
  'quantity': instance.quantity,
  'barcode': instance.barcode,
  'unit': instance.unit,
  'has_tax': instance.hasTax,
  'is_active': instance.isActive,
  'track_inventory': instance.trackInventory,
  'status': instance.status,
  'company_id': instance.companyId,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'id': instance.id,
};
