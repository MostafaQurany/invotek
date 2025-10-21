import 'package:json_annotation/json_annotation.dart';

part 'delete_invoice_response.g.dart';

@JsonSerializable()
class DeleteInvoiceResponse {
  final bool success;
  final String message;

  DeleteInvoiceResponse({required this.success, required this.message});

  factory DeleteInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteInvoiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteInvoiceResponseToJson(this);
}
