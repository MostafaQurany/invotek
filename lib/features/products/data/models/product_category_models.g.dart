// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategoryApiModel _$ProductCategoryApiModelFromJson(
  Map<String, dynamic> json,
) => ProductCategoryApiModel(
  id: (json['id'] as num).toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  status: json['status'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProductCategoryApiModelToJson(
  ProductCategoryApiModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'name': instance.name,
  'description': instance.description,
  'status': instance.status,
  'color': instance.color,
  'icon': instance.icon,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

CreateProductCategoryRequest _$CreateProductCategoryRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductCategoryRequest(
  name: json['name'] as String,
  status: json['status'] as String?,
  description: json['description'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$CreateProductCategoryRequestToJson(
  CreateProductCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'description': instance.description,
  'color': instance.color,
  'icon': instance.icon,
};

UpdateProductCategoryRequest _$UpdateProductCategoryRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProductCategoryRequest(
  name: json['name'] as String,
  status: json['status'] as String?,
  description: json['description'] as String?,
  color: json['color'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$UpdateProductCategoryRequestToJson(
  UpdateProductCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'description': instance.description,
  'color': instance.color,
  'icon': instance.icon,
};

ListProductCategoriesResponse _$ListProductCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => ListProductCategoriesResponse(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductCategoryApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  firstPageUrl: json['firstPageUrl'] as String?,
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['lastPage'] as num?)?.toInt(),
  lastPageUrl: json['lastPageUrl'] as String?,
  links: json['links'] as List<dynamic>?,
  nextPageUrl: json['nextPageUrl'] as String?,
  path: json['path'] as String?,
  perPage: (json['perPage'] as num?)?.toInt(),
  prevPageUrl: json['prevPageUrl'] as String?,
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$ListProductCategoriesResponseToJson(
  ListProductCategoriesResponse instance,
) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'data': instance.data,
  'firstPageUrl': instance.firstPageUrl,
  'from': instance.from,
  'lastPage': instance.lastPage,
  'lastPageUrl': instance.lastPageUrl,
  'links': instance.links,
  'nextPageUrl': instance.nextPageUrl,
  'path': instance.path,
  'perPage': instance.perPage,
  'prevPageUrl': instance.prevPageUrl,
  'to': instance.to,
  'total': instance.total,
};

CreateProductCategoryResponse _$CreateProductCategoryResponseFromJson(
  Map<String, dynamic> json,
) => CreateProductCategoryResponse(
  name: json['name'] as String,
  status: json['status'] as String?,
  companyId: (json['companyId'] as num?)?.toInt(),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateProductCategoryResponseToJson(
  CreateProductCategoryResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'companyId': instance.companyId,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
  'id': instance.id,
};

DeleteProductCategoryResponse _$DeleteProductCategoryResponseFromJson(
  Map<String, dynamic> json,
) => DeleteProductCategoryResponse(message: json['message'] as String?);

Map<String, dynamic> _$DeleteProductCategoryResponseToJson(
  DeleteProductCategoryResponse instance,
) => <String, dynamic>{'message': instance.message};
