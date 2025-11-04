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
  descreption: json['descreption'] as String?,
);

Map<String, dynamic> _$CreateProductCategoryRequestToJson(
  CreateProductCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'descreption': instance.descreption,
};

UpdateProductCategoryRequest _$UpdateProductCategoryRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProductCategoryRequest(
  name: json['name'] as String,
  status: json['status'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$UpdateProductCategoryRequestToJson(
  UpdateProductCategoryRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'description': instance.description,
};

ListProductCategoriesResponse _$ListProductCategoriesResponseFromJson(
  Map<String, dynamic> json,
) => ListProductCategoriesResponse(
  currentPage: (json['current_page'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductCategoryApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  firstPageUrl: json['first_page_url'] as String?,
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  lastPageUrl: json['last_page_url'] as String?,
  links: json['links'] as List<dynamic>?,
  nextPageUrl: json['next_page_url'] as String?,
  path: json['path'] as String?,
  perPage: (json['per_page'] as num?)?.toInt(),
  prevPageUrl: json['prev_page_url'] as String?,
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$ListProductCategoriesResponseToJson(
  ListProductCategoriesResponse instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.data,
  'first_page_url': instance.firstPageUrl,
  'from': instance.from,
  'last_page': instance.lastPage,
  'last_page_url': instance.lastPageUrl,
  'links': instance.links,
  'next_page_url': instance.nextPageUrl,
  'path': instance.path,
  'per_page': instance.perPage,
  'prev_page_url': instance.prevPageUrl,
  'to': instance.to,
  'total': instance.total,
};

CreateProductCategoryResponse _$CreateProductCategoryResponseFromJson(
  Map<String, dynamic> json,
) => CreateProductCategoryResponse(
  name: json['name'] as String,
  status: json['status'] as String?,
  companyId: (json['company_id'] as num?)?.toInt(),
  description: json['description'] as String?,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CreateProductCategoryResponseToJson(
  CreateProductCategoryResponse instance,
) => <String, dynamic>{
  'name': instance.name,
  'status': instance.status,
  'company_id': instance.companyId,
  'description': instance.description,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'id': instance.id,
};

DeleteProductCategoryResponse _$DeleteProductCategoryResponseFromJson(
  Map<String, dynamic> json,
) => DeleteProductCategoryResponse(message: json['message'] as String?);

Map<String, dynamic> _$DeleteProductCategoryResponseToJson(
  DeleteProductCategoryResponse instance,
) => <String, dynamic>{'message': instance.message};
