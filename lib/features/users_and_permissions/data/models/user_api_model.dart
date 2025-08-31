import 'package:json_annotation/json_annotation.dart';
import 'company_api_model.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class UserApiModel {
  final int id;
  final String name;
  final String email;
  @JsonKey(name: 'google_id')
  final String? googleId;
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  final String status;
  @JsonKey(name: 'current_team_id')
  final int? currentTeamId;
  @JsonKey(name: 'profile_photo_path')
  final String? profilePhotoPath;
  final String? phone;
  final String? position;
  final String role;
  @JsonKey(name: 'two_factor_confirmed_at')
  final String? twoFactorConfirmedAt;
  @JsonKey(name: 'company_id')
  final int companyId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;
  final CompanyApiModel? company;

  UserApiModel({
    required this.id,
    required this.name,
    required this.email,
    this.googleId,
    this.emailVerifiedAt,
    required this.status,
    this.currentTeamId,
    this.profilePhotoPath,
    this.phone,
    this.position,
    required this.role,
    this.twoFactorConfirmedAt,
    required this.companyId,
    required this.createdAt,
    required this.updatedAt,
    this.profilePhotoUrl,
    this.company,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserApiModelToJson(this);
}
