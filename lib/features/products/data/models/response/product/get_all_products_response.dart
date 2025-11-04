import 'package:json_annotation/json_annotation.dart';

import '../../product_api_model.dart';

part 'get_all_products_response.g.dart';

@JsonSerializable()
class GetAllProductsResponse {
  final String? message;
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final List<ProductApiModel>? data;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final int? to;
  final int? total;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  GetAllProductsResponse({
    this.message,
    this.currentPage,
    this.data,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  factory GetAllProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductsResponseToJson(this);
}
