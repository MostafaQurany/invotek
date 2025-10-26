// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAccountResponse _$DeleteAccountResponseFromJson(
  Map<String, dynamic> json,
) => DeleteAccountResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$DeleteAccountResponseToJson(
  DeleteAccountResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
