// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductRequest _$UpdateProductRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProductRequest(
  name: json['name'] as String,
  productCategoryId: (json['product_category_id'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  cost: (json['cost'] as num?)?.toDouble(),
  taxRate: (json['tax_rate'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt(),
  barcode: json['barcode'] as String?,
  unit: json['unit'] as String?,
  hasTax: json['has_tax'] as bool?,
  isActive: json['is_active'] as bool?,
  trackInventory: json['track_inventory'] as bool?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$UpdateProductRequestToJson(
  UpdateProductRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'product_category_id': ?instance.productCategoryId,
  'sku': ?instance.sku,
  'description': ?instance.description,
  'image': ?instance.image,
  'price': ?instance.price,
  'cost': ?instance.cost,
  'tax_rate': ?instance.taxRate,
  'quantity': ?instance.quantity,
  'barcode': ?instance.barcode,
  'unit': ?instance.unit,
  'has_tax': ?instance.hasTax,
  'is_active': ?instance.isActive,
  'track_inventory': ?instance.trackInventory,
  'status': ?instance.status,
};
