class InvoiceCustomerEntity {
  final int? id;
  final int? companyId;
  final String? name;
  final String? email;
  final String? phone;
  final String? taxNumber;
  final String? address;
  final String? notes;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  const InvoiceCustomerEntity({
    this.id,
    this.companyId,
    this.name,
    this.email,
    this.phone,
    this.taxNumber,
    this.address,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  InvoiceCustomerEntity copyWith({
    int? id,
    int? companyId,
    String? name,
    String? email,
    String? phone,
    String? taxNumber,
    String? address,
    String? notes,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) {
    return InvoiceCustomerEntity(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      taxNumber: taxNumber ?? this.taxNumber,
      address: address ?? this.address,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

