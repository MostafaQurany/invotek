import 'package:json_annotation/json_annotation.dart';

part 'product_category_models.g.dart';

@JsonSerializable()
class ProductCategoryApiModel {
  final int id;
  final int? companyId;
  final String name;
  final String? description;
  final String? status;
  final String? color;
  final String? icon;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProductCategoryApiModel({
    required this.id,
    this.companyId,
    required this.name,
    this.description,
    this.status,
    this.color,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductCategoryApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCategoryApiModelToJson(this);
}

@JsonSerializable()
class CreateProductCategoryRequest {
  final String name;
  final String? status;
  final String? description;
  final String? color;
  final String? icon;

  CreateProductCategoryRequest({
    required this.name,
    this.status,
    this.description,
    this.color,
    this.icon,
  });

  factory CreateProductCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductCategoryRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateProductCategoryRequestToJson(this);
}

@JsonSerializable()
class UpdateProductCategoryRequest {
  final String name;
  final String? status;
  final String? description;
  final String? color;
  final String? icon;

  UpdateProductCategoryRequest({
    required this.name,
    this.status,
    this.description,
    this.color,
    this.icon,
  });

  factory UpdateProductCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductCategoryRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateProductCategoryRequestToJson(this);
}

@JsonSerializable()
class ListProductCategoriesResponse {
  final int? currentPage;
  final List<ProductCategoryApiModel>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<dynamic>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  ListProductCategoriesResponse({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory ListProductCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductCategoriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListProductCategoriesResponseToJson(this);
}

@JsonSerializable()
class CreateProductCategoryResponse {
  final String name;
  final String? status;
  final int? companyId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  CreateProductCategoryResponse({
    required this.name,
    this.status,
    this.companyId,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CreateProductCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductCategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateProductCategoryResponseToJson(this);
}

@JsonSerializable()
class DeleteProductCategoryResponse {
  final String? message;
  DeleteProductCategoryResponse({this.message});

  factory DeleteProductCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductCategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteProductCategoryResponseToJson(this);
}
