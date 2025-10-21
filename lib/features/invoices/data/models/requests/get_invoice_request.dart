import 'package:json_annotation/json_annotation.dart';

part 'get_invoice_request.g.dart';

@JsonSerializable()
class GetInvoiceRequest {
  final String id;
  GetInvoiceRequest({required this.id});
  factory GetInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$GetInvoiceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$GetInvoiceRequestToJson(this);
}
