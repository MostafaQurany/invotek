import 'package:json_annotation/json_annotation.dart';

part 'delete_invoice_request.g.dart';

@JsonSerializable()
class DeleteInvoiceRequest {
  final String id;
  DeleteInvoiceRequest({required this.id});
  factory DeleteInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteInvoiceRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteInvoiceRequestToJson(this);
}
