// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateInvoiceResponse _$UpdateInvoiceResponseFromJson(
  Map<String, dynamic> json,
) => UpdateInvoiceResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: InvoiceModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateInvoiceResponseToJson(
  UpdateInvoiceResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
