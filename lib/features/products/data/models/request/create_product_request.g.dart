// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequest _$CreateProductRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductRequest(
  name: json['name'] as String,
  description: json['description'] as String?,
  price: json['price'] as String,
  cost: json['cost'] as String?,
  quantity: (json['quantity'] as num).toInt(),
  sku: json['sku'] as String?,
  barcode: json['barcode'] as String?,
  unit: json['unit'] as String?,
  taxRate: json['tax_rate'] as String?,
  notes: json['notes'] as String?,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  weight: json['weight'] as String?,
  dimensions: json['dimensions'] as String?,
  color: json['color'] as String?,
  material: json['material'] as String?,
  minQuantity: (json['min_quantity'] as num?)?.toInt(),
  maxQuantity: (json['max_quantity'] as num?)?.toInt(),
  isActive: json['is_active'] as bool? ?? true,
  hasTax: json['has_tax'] as bool? ?? false,
  trackInventory: json['track_inventory'] as bool? ?? false,
  status: json['status'] as String? ?? 'active',
  categoryId: (json['product_category_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateProductRequestToJson(
  CreateProductRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'cost': instance.cost,
  'quantity': instance.quantity,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'unit': instance.unit,
  'tax_rate': instance.taxRate,
  'notes': instance.notes,
  'brand': instance.brand,
  'model': instance.model,
  'weight': instance.weight,
  'dimensions': instance.dimensions,
  'color': instance.color,
  'material': instance.material,
  'min_quantity': instance.minQuantity,
  'max_quantity': instance.maxQuantity,
  'is_active': instance.isActive,
  'has_tax': instance.hasTax,
  'track_inventory': instance.trackInventory,
  'status': instance.status,
  'product_category_id': instance.categoryId,
};
