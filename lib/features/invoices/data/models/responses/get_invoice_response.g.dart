// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_invoice_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInvoiceResponse _$GetInvoiceResponseFromJson(Map<String, dynamic> json) =>
    GetInvoiceResponse(
      success: json['success'] as String,
      data: InvoiceModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetInvoiceResponseToJson(GetInvoiceResponse instance) =>
    <String, dynamic>{'success': instance.success, 'data': instance.data};
