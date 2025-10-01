// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_invoices_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllInvoicesRequest _$GetAllInvoicesRequestFromJson(
  Map<String, dynamic> json,
) => GetAllInvoicesRequest(
  search: json['search'] as String?,
  page: json['page'] as String?,
  status: json['status'] as String?,
  limit: json['limit'] as String?,
  sortBy: json['sortBy'] as String?,
  sortOrder: json['sortOrder'] as String?,
  minAmount: json['minAmount'] as String?,
  maxAmount: json['maxAmount'] as String?,
  customerId: json['customerId'] as String?,
  paymentMethod: json['paymentMethod'] as String?,
  dateFrom: json['dateFrom'] as String?,
  dateTo: json['dateTo'] as String?,
);

Map<String, dynamic> _$GetAllInvoicesRequestToJson(
  GetAllInvoicesRequest instance,
) => <String, dynamic>{
  'search': instance.search,
  'page': instance.page,
  'status': instance.status,
  'limit': instance.limit,
  'sortBy': instance.sortBy,
  'sortOrder': instance.sortOrder,
  'minAmount': instance.minAmount,
  'maxAmount': instance.maxAmount,
  'customerId': instance.customerId,
  'paymentMethod': instance.paymentMethod,
  'dateFrom': instance.dateFrom,
  'dateTo': instance.dateTo,
};
