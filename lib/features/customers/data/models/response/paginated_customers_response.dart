import 'package:json_annotation/json_annotation.dart';
import '../customer_api_model.dart';

part 'paginated_customers_response.g.dart';

@JsonSerializable()
class PaginatedCustomersResponse {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final List<CustomerApiModel>? data;
  @JsonKey(name: 'first_page_url')
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'last_page_url')
  final String? lastPageUrl;
  final List<PaginationLink>? links;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String? path;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  final int? to;
  final int? total;

  PaginatedCustomersResponse({
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

  factory PaginatedCustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCustomersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedCustomersResponseToJson(this);
}

@JsonSerializable()
class PaginationLink {
  final String? url;
  final String? label;
  final bool? active;

  PaginationLink({this.url, this.label, this.active});

  factory PaginationLink.fromJson(Map<String, dynamic> json) =>
      _$PaginationLinkFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationLinkToJson(this);
}
