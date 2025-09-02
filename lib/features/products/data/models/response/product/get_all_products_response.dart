import 'package:json_annotation/json_annotation.dart';

import '../../product_api_model.dart';

part 'get_all_products_response.g.dart';

@JsonSerializable()
class GetAllProductsResponse {
  final String? message;
  final int? currentPage;
  final List<ProductApiModel>? data;
  final int? from;
  final int? lastPage;
  final int? perPage;
  final int? to;
  final int? total;

  GetAllProductsResponse({
    this.message,
    this.currentPage,
    this.data,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
  });

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsResponseToJson(this);
}
