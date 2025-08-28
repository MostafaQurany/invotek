/// user : {"name":"أحمد محمد","email":"ahmed@example.com","role":"admin","status":"active","updated_at":"2025-08-04T08:53:47.000000Z","created_at":"2025-08-04T08:53:30.000000Z","id":26,"company_id":20,"profile_photo_url":"https://ui-avatars.com/api/?name=%D8%A3+%D9%85&color=7F9CF5&background=EBF4FF"}
/// company : {"name":"أحمد محمد Company","email":"ahmed@example.com","admin_id":26,"status":"active","updated_at":"2025-08-04T08:53:30.000000Z","created_at":"2025-08-04T08:53:30.000000Z","id":20,"admin":{"id":26,"name":"أحمد محمد","email":"ahmed@example.com","google_id":null,"email_verified_at":null,"status":"active","current_team_id":null,"profile_photo_path":null,"phone":null,"position":null,"role":"admin","two_factor_confirmed_at":null,"company_id":null,"created_at":"2025-08-04T08:53:30.000000Z","updated_at":"2025-08-04T08:53:30.000000Z","profile_photo_url":"https://ui-avatars.com/api/?name=%D8%A3+%D9%85&color=7F9CF5&background=EBF4FF"}}
/// token : "1|ak61ufzh1kDfj9uwI9YEwCr8OHE7AoRQVzCilzRD7f027f81"

class UserModel {
  UserModel({this.user, this.company, this.token});

  UserModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    company = json['company'] != null
        ? Company.fromJson(json['company'])
        : null;
    token = json['token'];
  }
  User? user;
  Company? company;
  String? token;
  UserModel copyWith({User? user, Company? company, String? token}) =>
      UserModel(
        user: user ?? this.user,
        company: company ?? this.company,
        token: token ?? this.token,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (company != null) {
      map['company'] = company?.toJson();
    }
    map['token'] = token;
    return map;
  }
}

/// name : "أحمد محمد Company"
/// email : "ahmed@example.com"
/// admin_id : 26
/// status : "active"
/// updated_at : "2025-08-04T08:53:30.000000Z"
/// created_at : "2025-08-04T08:53:30.000000Z"
/// id : 20
/// admin : {"id":26,"name":"أحمد محمد","email":"ahmed@example.com","google_id":null,"email_verified_at":null,"status":"active","current_team_id":null,"profile_photo_path":null,"phone":null,"position":null,"role":"admin","two_factor_confirmed_at":null,"company_id":null,"created_at":"2025-08-04T08:53:30.000000Z","updated_at":"2025-08-04T08:53:30.000000Z","profile_photo_url":"https://ui-avatars.com/api/?name=%D8%A3+%D9%85&color=7F9CF5&background=EBF4FF"}

class Company {
  Company({
    this.name,
    this.email,
    this.adminId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.admin,
  });

  Company.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    adminId = json['admin_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
  }
  String? name;
  String? email;
  int? adminId;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;
  Admin? admin;
  Company copyWith({
    String? name,
    String? email,
    int? adminId,
    String? status,
    String? updatedAt,
    String? createdAt,
    int? id,
    Admin? admin,
  }) => Company(
    name: name ?? this.name,
    email: email ?? this.email,
    adminId: adminId ?? this.adminId,
    status: status ?? this.status,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    id: id ?? this.id,
    admin: admin ?? this.admin,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['admin_id'] = adminId;
    map['status'] = status;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    if (admin != null) {
      map['admin'] = admin?.toJson();
    }
    return map;
  }
}

/// id : 26
/// name : "أحمد محمد"
/// email : "ahmed@example.com"
/// google_id : null
/// email_verified_at : null
/// status : "active"
/// current_team_id : null
/// profile_photo_path : null
/// phone : null
/// position : null
/// role : "admin"
/// two_factor_confirmed_at : null
/// company_id : null
/// created_at : "2025-08-04T08:53:30.000000Z"
/// updated_at : "2025-08-04T08:53:30.000000Z"
/// profile_photo_url : "https://ui-avatars.com/api/?name=%D8%A3+%D9%85&color=7F9CF5&background=EBF4FF"

class Admin {
  Admin({
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
  });

  Admin.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    googleId = json['google_id'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    currentTeamId = json['current_team_id'];
    profilePhotoPath = json['profile_photo_path'];
    phone = json['phone'];
    position = json['position'];
    role = json['role'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    companyId = json['company_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  int? id;
  String? name;
  String? email;
  dynamic googleId;
  dynamic emailVerifiedAt;
  String? status;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  dynamic phone;
  dynamic position;
  String? role;
  dynamic twoFactorConfirmedAt;
  dynamic companyId;
  String? createdAt;
  String? updatedAt;
  String? profilePhotoUrl;
  Admin copyWith({
    int? id,
    String? name,
    String? email,
    dynamic googleId,
    dynamic emailVerifiedAt,
    String? status,
    dynamic currentTeamId,
    dynamic profilePhotoPath,
    dynamic phone,
    dynamic position,
    String? role,
    dynamic twoFactorConfirmedAt,
    dynamic companyId,
    String? createdAt,
    String? updatedAt,
    String? profilePhotoUrl,
  }) => Admin(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    googleId: googleId ?? this.googleId,
    emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
    status: status ?? this.status,
    currentTeamId: currentTeamId ?? this.currentTeamId,
    profilePhotoPath: profilePhotoPath ?? this.profilePhotoPath,
    phone: phone ?? this.phone,
    position: position ?? this.position,
    role: role ?? this.role,
    twoFactorConfirmedAt: twoFactorConfirmedAt ?? this.twoFactorConfirmedAt,
    companyId: companyId ?? this.companyId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['google_id'] = googleId;
    map['email_verified_at'] = emailVerifiedAt;
    map['status'] = status;
    map['current_team_id'] = currentTeamId;
    map['profile_photo_path'] = profilePhotoPath;
    map['phone'] = phone;
    map['position'] = position;
    map['role'] = role;
    map['two_factor_confirmed_at'] = twoFactorConfirmedAt;
    map['company_id'] = companyId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }
}

/// name : "أحمد محمد"
/// email : "ahmed@example.com"
/// role : "admin"
/// status : "active"
/// updated_at : "2025-08-04T08:53:47.000000Z"
/// created_at : "2025-08-04T08:53:30.000000Z"
/// id : 26
/// company_id : 20
/// profile_photo_url : "https://ui-avatars.com/api/?name=%D8%A3+%D9%85&color=7F9CF5&background=EBF4FF"

class User {
  User({
    this.name,
    this.email,
    this.role,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.companyId,
    this.profilePhotoUrl,
  });

  User.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    companyId = json['company_id'];
    profilePhotoUrl = json['profile_photo_url'];
  }
  String? name;
  String? email;
  String? role;
  String? status;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? companyId;
  String? profilePhotoUrl;
  User copyWith({
    String? name,
    String? email,
    String? role,
    String? status,
    String? updatedAt,
    String? createdAt,
    int? id,
    int? companyId,
    String? profilePhotoUrl,
  }) => User(
    name: name ?? this.name,
    email: email ?? this.email,
    role: role ?? this.role,
    status: status ?? this.status,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    id: id ?? this.id,
    companyId: companyId ?? this.companyId,
    profilePhotoUrl: profilePhotoUrl ?? this.profilePhotoUrl,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    map['status'] = status;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    map['company_id'] = companyId;
    map['profile_photo_url'] = profilePhotoUrl;
    return map;
  }
}
