import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/customers/ui/widgets/forms/customer_form_field.dart';
import 'package:invotek/features/customers/ui/widgets/forms/customer_status_dropdown.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerForm extends StatefulWidget {
  final String? initialName;
  final String? initialEmail;
  final String? initialPhone;
  final String? initialAddress;
  final String? initialTaxNumber;
  final String? initialNotes;
  final String initialStatus;
  final Function(CustomerFormData) onSubmit;
  final bool isLoading;

  const CustomerForm({
    super.key,
    this.initialName,
    this.initialEmail,
    this.initialPhone,
    this.initialAddress,
    this.initialTaxNumber,
    this.initialNotes,
    this.initialStatus = 'active',
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  State<CustomerForm> createState() => CustomerFormState();
}

class CustomerFormState extends State<CustomerForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _taxNumberController;
  late TextEditingController _notesController;

  late String _selectedStatus;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.initialName ?? '');
    _emailController = TextEditingController(text: widget.initialEmail ?? '');
    _phoneController = TextEditingController(text: widget.initialPhone ?? '');
    _addressController = TextEditingController(
      text: widget.initialAddress ?? '',
    );
    _taxNumberController = TextEditingController(
      text: widget.initialTaxNumber ?? '',
    );
    _notesController = TextEditingController(text: widget.initialNotes ?? '');
    _selectedStatus = widget.initialStatus;
  }

  void submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final formData = CustomerFormData(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        address: _addressController.text.trim().isEmpty
            ? null
            : _addressController.text.trim(),
        taxNumber: _taxNumberController.text.trim().isEmpty
            ? null
            : _taxNumberController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        status: _selectedStatus,
      );

      widget.onSubmit(formData);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _taxNumberController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name Field
            CustomerFormField(
              label: s.customerName,
              controller: _nameController,
              icon: Icons.person_outline,
              isRequired: true,
              validator: _validateName,
            ),
            SizedBox(height: 16.h),

            // Email Field
            CustomerFormField(
              label: s.customerEmail,
              controller: _emailController,
              icon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              isRequired: true,
              validator: _validateEmail,
            ),
            SizedBox(height: 16.h),

            // Phone Field
            CustomerFormField(
              label: s.customerPhone,
              controller: _phoneController,
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              isRequired: true,
              validator: _validatePhone,
            ),
            SizedBox(height: 16.h),

            // Address Field
            CustomerFormField(
              label: s.customerAddress,
              controller: _addressController,
              icon: Icons.location_on_outlined,
              maxLines: 2,
            ),
            SizedBox(height: 16.h),

            // Tax Number Field
            CustomerFormField(
              label: s.customerTaxNumber,
              controller: _taxNumberController,
              icon: Icons.receipt_outlined,
            ),
            SizedBox(height: 16.h),

            // Status Dropdown
            CustomerStatusDropdown(
              value: _selectedStatus,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedStatus = value;
                  });
                }
              },
            ),
            SizedBox(height: 16.h),

            // Notes Field
            CustomerFormField(
              label: s.customerNotes,
              controller: _notesController,
              icon: Icons.note_outlined,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).customerNameRequired;
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).customerEmailRequired;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
      return S.of(context).emailInvalid;
    }

    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).customerPhoneRequired;
    }

    if (!RegExp(r'^[+]?[\d\s\-\(\)]{7,}$').hasMatch(value.trim())) {
      return S.of(context).customersInvalidPhoneFormat;
    }

    return null;
  }
}

class CustomerFormData {
  final String name;
  final String email;
  final String phone;
  final String? address;
  final String? taxNumber;
  final String? notes;
  final String status;

  const CustomerFormData({
    required this.name,
    required this.email,
    required this.phone,
    this.address,
    this.taxNumber,
    this.notes,
    required this.status,
  });
}
