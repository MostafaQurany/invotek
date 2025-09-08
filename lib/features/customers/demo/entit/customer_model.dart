class CustomerModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String status;
  final String? taxNumber;
  final String? notes;
  final String? companyName;
  final String? commercialRegister;
  final String? city;
  final String? region;
  final String? postalCode;
  final String? detailedAddress;
  final String? responsiblePerson;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CustomerModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    required this.status,
    this.taxNumber,
    this.notes,
    this.companyName,
    this.commercialRegister,
    this.city,
    this.region,
    this.postalCode,
    this.detailedAddress,
    this.responsiblePerson,
    this.createdAt,
    this.updatedAt,
  });

  String get createdAtString => createdAt != null
      ? '${createdAt!.day.toString().padLeft(2, '0')}/${createdAt!.month.toString().padLeft(2, '0')}/${createdAt!.year}'
      : '';
  String get updatedAtString => updatedAt != null
      ? '${updatedAt!.day.toString().padLeft(2, '0')}/${updatedAt!.month.toString().padLeft(2, '0')}/${updatedAt!.year}'
      : '';

  CustomerModel copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? status,
    String? taxNumber,
    String? notes,
    String? companyName,
    String? commercialRegister,
    String? city,
    String? region,
    String? postalCode,
    String? detailedAddress,
    String? responsiblePerson,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      status: status ?? this.status,
      taxNumber: taxNumber ?? this.taxNumber,
      notes: notes ?? this.notes,
      companyName: companyName ?? this.companyName,
      commercialRegister: commercialRegister ?? this.commercialRegister,
      city: city ?? this.city,
      region: region ?? this.region,
      postalCode: postalCode ?? this.postalCode,
      detailedAddress: detailedAddress ?? this.detailedAddress,
      responsiblePerson: responsiblePerson ?? this.responsiblePerson,
    );
  }
}
