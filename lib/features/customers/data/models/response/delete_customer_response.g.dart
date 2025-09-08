// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCustomerResponse _$DeleteCustomerResponseFromJson(
  Map<String, dynamic> json,
) => DeleteCustomerResponse(
  message: json['message'] as String?,
  success: json['success'] as bool?,
);

Map<String, dynamic> _$DeleteCustomerResponseToJson(
  DeleteCustomerResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};
