import 'package:json_annotation/json_annotation.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';

part 'profile_models.g.dart';

@JsonSerializable()
class ProfileResponse {
  final bool success;
  final String? message;
  final _ProfileData data;

  ProfileResponse({required this.success, this.message, required this.data});

  User get user => data.user;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class _ProfileData {
  final User user;

  _ProfileData({required this.user});

  factory _ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataToJson(this);
}


