class Client {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? company;
  final String? taxNumber;
  final String? notes;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String? avatar;
  final String? website;
  final String? contactPerson;
  final String? contactPhone;
  final String? contactEmail;

  Client({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.company,
    this.taxNumber,
    this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
    this.website,
    this.contactPerson,
    this.contactPhone,
    this.contactEmail,
  });

  Client copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? company,
    String? taxNumber,
    String? notes,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? avatar,
    String? website,
    String? contactPerson,
    String? contactPhone,
    String? contactEmail,
  }) {
    return Client(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      company: company ?? this.company,
      taxNumber: taxNumber ?? this.taxNumber,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      avatar: avatar ?? this.avatar,
      website: website ?? this.website,
      contactPerson: contactPerson ?? this.contactPerson,
      contactPhone: contactPhone ?? this.contactPhone,
      contactEmail: contactEmail ?? this.contactEmail,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'company': company,
      'taxNumber': taxNumber,
      'notes': notes,
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'avatar': avatar,
      'website': website,
      'contactPerson': contactPerson,
      'contactPhone': contactPhone,
      'contactEmail': contactEmail,
    };
  }

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      company: json['company'] as String?,
      taxNumber: json['taxNumber'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      avatar: json['avatar'] as String?,
      website: json['website'] as String?,
      contactPerson: json['contactPerson'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
    );
  }

  @override
  String toString() {
    return 'Client(id: $id, name: $name, email: $email, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Client && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
