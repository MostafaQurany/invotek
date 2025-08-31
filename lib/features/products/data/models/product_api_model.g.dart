// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: ProductApiModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ProductApiModel _$ProductApiModelFromJson(Map<String, dynamic> json) =>
    ProductApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num).toDouble(),
      costPrice: (json['costPrice'] as num?)?.toDouble(),
      quantity: (json['quantity'] as num).toInt(),
      sku: json['sku'] as String?,
      barcode: json['barcode'] as String?,
      category: json['category'] as String,
      status: json['status'] as String,
      image: json['image'] as String?,
      unit: json['unit'] as String?,
      taxRate: (json['taxRate'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      dimensions: json['dimensions'] as String?,
      color: json['color'] as String?,
      material: json['material'] as String?,
      minQuantity: (json['min_quantity'] as num?)?.toInt(),
      maxQuantity: (json['max_quantity'] as num?)?.toInt(),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$ProductApiModelToJson(ProductApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'costPrice': instance.costPrice,
      'quantity': instance.quantity,
      'sku': instance.sku,
      'barcode': instance.barcode,
      'category': instance.category,
      'status': instance.status,
      'image': instance.image,
      'unit': instance.unit,
      'taxRate': instance.taxRate,
      'notes': instance.notes,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'brand': instance.brand,
      'model': instance.model,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'color': instance.color,
      'material': instance.material,
      'min_quantity': instance.minQuantity,
      'max_quantity': instance.maxQuantity,
      'is_active': instance.isActive,
    };

CreateProductRequest _$CreateProductRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductRequest(
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num).toDouble(),
  costPrice: (json['costPrice'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  sku: json['sku'] as String?,
  barcode: json['barcode'] as String?,
  category: json['category'] as String,
  status: json['status'] as String,
  unit: json['unit'] as String?,
  taxRate: (json['taxRate'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  weight: (json['weight'] as num?)?.toDouble(),
  dimensions: json['dimensions'] as String?,
  color: json['color'] as String?,
  material: json['material'] as String?,
  minQuantity: (json['min_quantity'] as num?)?.toInt(),
  maxQuantity: (json['max_quantity'] as num?)?.toInt(),
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$CreateProductRequestToJson(
  CreateProductRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'costPrice': instance.costPrice,
  'quantity': instance.quantity,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'category': instance.category,
  'status': instance.status,
  'unit': instance.unit,
  'taxRate': instance.taxRate,
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
};

UpdateProductRequest _$UpdateProductRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProductRequest(
  name: json['name'] as String,
  description: json['description'] as String?,
  price: (json['price'] as num).toDouble(),
  costPrice: (json['costPrice'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  sku: json['sku'] as String?,
  barcode: json['barcode'] as String?,
  category: json['category'] as String,
  status: json['status'] as String,
  unit: json['unit'] as String?,
  taxRate: (json['taxRate'] as num?)?.toDouble(),
  notes: json['notes'] as String?,
  brand: json['brand'] as String?,
  model: json['model'] as String?,
  weight: (json['weight'] as num?)?.toDouble(),
  dimensions: json['dimensions'] as String?,
  color: json['color'] as String?,
  material: json['material'] as String?,
  minQuantity: (json['min_quantity'] as num?)?.toInt(),
  maxQuantity: (json['max_quantity'] as num?)?.toInt(),
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$UpdateProductRequestToJson(
  UpdateProductRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'costPrice': instance.costPrice,
  'quantity': instance.quantity,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'category': instance.category,
  'status': instance.status,
  'unit': instance.unit,
  'taxRate': instance.taxRate,
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
};

ProductsFilterRequest _$ProductsFilterRequestFromJson(
  Map<String, dynamic> json,
) => ProductsFilterRequest(
  search: json['search'] as String?,
  category: json['category'] as String?,
  status: json['status'] as String?,
  brand: json['brand'] as String?,
  minPrice: (json['minPrice'] as num?)?.toDouble(),
  maxPrice: (json['maxPrice'] as num?)?.toDouble(),
  minQuantity: (json['minQuantity'] as num?)?.toInt(),
  maxQuantity: (json['maxQuantity'] as num?)?.toInt(),
  sortBy: json['sortBy'] as String?,
  sortOrder: json['sortOrder'] as String?,
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsFilterRequestToJson(
  ProductsFilterRequest instance,
) => <String, dynamic>{
  'search': instance.search,
  'category': instance.category,
  'status': instance.status,
  'brand': instance.brand,
  'minPrice': instance.minPrice,
  'maxPrice': instance.maxPrice,
  'minQuantity': instance.minQuantity,
  'maxQuantity': instance.maxQuantity,
  'sortBy': instance.sortBy,
  'sortOrder': instance.sortOrder,
  'page': instance.page,
  'limit': instance.limit,
};
