import 'package:json_annotation/json_annotation.dart';

part 'product_api_model.g.dart';

@JsonSerializable()
class ProductsResponse {
  final bool success;
  final String message;
  final List<ProductApiModel> data;
  final int total;
  final int page;
  final int limit;

  const ProductsResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}

@JsonSerializable()
class ProductResponse {
  final bool success;
  final String message;
  final ProductApiModel data;

  const ProductResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class ProductApiModel {
  final int id;
  final String name;
  final String? description;
  final double price;
  final double? costPrice;
  final int quantity;
  final String? sku;
  final String? barcode;
  final String category;
  final String status;
  final String? image;
  final String? unit;
  final double? taxRate;
  final String? notes;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final String? brand;
  final String? model;
  final double? weight;
  final String? dimensions;
  final String? color;
  final String? material;
  @JsonKey(name: 'min_quantity')
  final int? minQuantity;
  @JsonKey(name: 'max_quantity')
  final int? maxQuantity;
  @JsonKey(name: 'is_active')
  final bool isActive;

  const ProductApiModel({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    this.costPrice,
    required this.quantity,
    this.sku,
    this.barcode,
    required this.category,
    required this.status,
    this.image,
    this.unit,
    this.taxRate,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    this.brand,
    this.model,
    this.weight,
    this.dimensions,
    this.color,
    this.material,
    this.minQuantity,
    this.maxQuantity,
    required this.isActive,
  });

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductApiModelToJson(this);
}

@JsonSerializable()
class CreateProductRequest {
  final String name;
  final String? description;
  final double price;
  final double? costPrice;
  final int quantity;
  final String? sku;
  final String? barcode;
  final String category;
  final String status;
  final String? unit;
  final double? taxRate;
  final String? notes;
  final String? brand;
  final String? model;
  final double? weight;
  final String? dimensions;
  final String? color;
  final String? material;
  @JsonKey(name: 'min_quantity')
  final int? minQuantity;
  @JsonKey(name: 'max_quantity')
  final int? maxQuantity;
  @JsonKey(name: 'is_active')
  final bool isActive;

  const CreateProductRequest({
    required this.name,
    this.description,
    required this.price,
    this.costPrice,
    required this.quantity,
    this.sku,
    this.barcode,
    required this.category,
    required this.status,
    this.unit,
    this.taxRate,
    this.notes,
    this.brand,
    this.model,
    this.weight,
    this.dimensions,
    this.color,
    this.material,
    this.minQuantity,
    this.maxQuantity,
    required this.isActive,
  });

  factory CreateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductRequestToJson(this);
}

@JsonSerializable()
class UpdateProductRequest {
  final String name;
  final String? description;
  final double price;
  final double? costPrice;
  final int quantity;
  final String? sku;
  final String? barcode;
  final String category;
  final String status;
  final String? unit;
  final double? taxRate;
  final String? notes;
  final String? brand;
  final String? model;
  final double? weight;
  final String? dimensions;
  final String? color;
  final String? material;
  @JsonKey(name: 'min_quantity')
  final int? minQuantity;
  @JsonKey(name: 'max_quantity')
  final int? maxQuantity;
  @JsonKey(name: 'is_active')
  final bool isActive;

  const UpdateProductRequest({
    required this.name,
    this.description,
    required this.price,
    this.costPrice,
    required this.quantity,
    this.sku,
    this.barcode,
    required this.category,
    required this.status,
    this.unit,
    this.taxRate,
    this.notes,
    this.brand,
    this.model,
    this.weight,
    this.dimensions,
    this.color,
    this.material,
    this.minQuantity,
    this.maxQuantity,
    required this.isActive,
  });

  factory UpdateProductRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductRequestToJson(this);
}

@JsonSerializable()
class ProductsFilterRequest {
  final String? search;
  final String? category;
  final String? status;
  final String? brand;
  final double? minPrice;
  final double? maxPrice;
  final int? minQuantity;
  final int? maxQuantity;
  final String? sortBy;
  final String? sortOrder;
  final int? page;
  final int? limit;

  const ProductsFilterRequest({
    this.search,
    this.category,
    this.status,
    this.brand,
    this.minPrice,
    this.maxPrice,
    this.minQuantity,
    this.maxQuantity,
    this.sortBy,
    this.sortOrder,
    this.page,
    this.limit,
  });

  factory ProductsFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductsFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsFilterRequestToJson(this);
}
