import 'package:json_annotation/json_annotation.dart';

part 'get_all_invoices_request.g.dart';

@JsonSerializable()
class GetAllInvoicesRequest {
  final String? search;
  final String? page;
  final String? status;
  final String? limit;
  final String? sortBy;
  final String? sortOrder;
  final String? minAmount;
  final String? maxAmount;
  final String? customerId;
  final String? paymentMethod;
  final String? dateFrom;
  final String? dateTo;

  GetAllInvoicesRequest({
    this.search,
    this.page,
    this.status,
    this.limit,
    this.sortBy,
    this.sortOrder,
    this.minAmount,
    this.maxAmount,
    this.customerId,
    this.paymentMethod,
    this.dateFrom,
    this.dateTo,
  });

  factory GetAllInvoicesRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAllInvoicesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllInvoicesRequestToJson(this);
}
