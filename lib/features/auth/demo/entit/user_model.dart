import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart'; // change the file name accordingly

@JsonSerializable(explicitToJson: true)
class UserModel {
  UserModel({this.user, this.token});

  User? user;
  String? token;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
  User({
    this.id,
    this.name,
    this.email,
    this.googleId,
    this.emailVerifiedAt,
    this.status,
    this.currentTeamId,
    this.profilePhotoPath,
    this.phone,
    this.position,
    this.role,
    this.twoFactorConfirmedAt,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
    this.company,
  });

  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'google_id')
  dynamic googleId;
  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;
  String? status;
  @JsonKey(name: 'current_team_id')
  dynamic currentTeamId;
  @JsonKey(name: 'profile_photo_path')
  dynamic profilePhotoPath;
  dynamic phone;
  dynamic position;
  String? role;
  @JsonKey(name: 'two_factor_confirmed_at')
  dynamic twoFactorConfirmedAt;
  @JsonKey(name: 'company_id')
  int? companyId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'profile_photo_url')
  String? profilePhotoUrl;
  Company? company;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Company {
  Company({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.taxMerchantCode,
    this.taxInvoiceType,
    this.taxIntegrationActive,
    this.logo,
    this.status,
    this.adminId,
    this.createdAt,
    this.updatedAt,
    this.admin,
  });

  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  @JsonKey(name: 'tax_merchant_code')
  dynamic taxMerchantCode;
  @JsonKey(name: 'tax_invoice_type')
  dynamic taxInvoiceType;
  @JsonKey(name: 'tax_integration_active')
  bool? taxIntegrationActive;
  dynamic logo;
  String? status;
  @JsonKey(name: 'admin_id')
  int? adminId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  User? admin;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
