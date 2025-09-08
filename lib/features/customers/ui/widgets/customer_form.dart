import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerForm extends StatefulWidget {
  final String? initialName;
  final String? initialEmail;
  final String? initialPhone;
  final String? initialAddress;
  final String? initialTaxNumber;
  final String? initialNotes;
  final String? initialStatus;
  final String? initialCompanyName;
  final String? initialCommercialRegister;
  final String? initialCity;
  final String? initialRegion;
  final String? initialPostalCode;
  final String? initialDetailedAddress;
  final String? initialResponsiblePerson;
  final bool isEditing;
  final Function(
    String name,
    String email,
    String? phone,
    String? address,
    String? taxNumber,
    String? notes,
    String status,
    String? companyName,
    String? commercialRegister,
    String? city,
    String? region,
    String? postalCode,
    String? detailedAddress,
    String? responsiblePerson,
  )
  onSubmit;
  final VoidCallback? onCancel;

  const CustomerForm({
    super.key,
    this.initialName,
    this.initialEmail,
    this.initialPhone,
    this.initialAddress,
    this.initialTaxNumber,
    this.initialNotes,
    this.initialStatus,
    this.initialCompanyName,
    this.initialCommercialRegister,
    this.initialCity,
    this.initialRegion,
    this.initialPostalCode,
    this.initialDetailedAddress,
    this.initialResponsiblePerson,
    this.isEditing = false,
    required this.onSubmit,
    this.onCancel,
  });

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _taxNumberController;
  late TextEditingController _notesController;
  late TextEditingController _companyNameController;
  late TextEditingController _commercialRegisterController;
  late TextEditingController _cityController;
  late TextEditingController _regionController;
  late TextEditingController _postalCodeController;
  late TextEditingController _detailedAddressController;
  late TextEditingController _responsiblePersonController;
  String _selectedStatus = 'active';

  final List<String> _statusOptions = ['active', 'inactive'];
  List<String> _statusLabels = ['Active', 'Inactive']; // Default values

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
    _companyNameController = TextEditingController(
      text: widget.initialCompanyName ?? '',
    );
    _commercialRegisterController = TextEditingController(
      text: widget.initialCommercialRegister ?? '',
    );
    _cityController = TextEditingController(text: widget.initialCity ?? '');
    _regionController = TextEditingController(text: widget.initialRegion ?? '');
    _postalCodeController = TextEditingController(
      text: widget.initialPostalCode ?? '',
    );
    _detailedAddressController = TextEditingController(
      text: widget.initialDetailedAddress ?? '',
    );
    _responsiblePersonController = TextEditingController(
      text: widget.initialResponsiblePerson ?? '',
    );
    _selectedStatus = widget.initialStatus ?? 'active';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize status labels when context is available
    final s = S.of(context);
    _statusLabels = [s.customerStatusActive, s.customerStatusInactive];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _taxNumberController.dispose();
    _notesController.dispose();
    _companyNameController.dispose();
    _commercialRegisterController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _postalCodeController.dispose();
    _detailedAddressController.dispose();
    _responsiblePersonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Customer Information Header
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              s.customerBasicInfo,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(height: 24.h),

          // Basic Information Section
          Text(
            s.customerBasicInfoSection,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 16.h),

          // Name Field
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: '${s.customerName} *',
              hintText: s.customerName,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.person_outline,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return s.customerNameRequired;
              }
              return null;
            },
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 16.h),

          // Company Name Field
          TextFormField(
            controller: _companyNameController,
            decoration: InputDecoration(
              labelText: s.customerCompanyName,
              hintText: s.customerCompanyName,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.business_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 16.h),

          // Email Field
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: s.customerEmail,
              hintText: 'example@email.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.email_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return s.emailInvalid;
                }
              }
              return null;
            },
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: 16.h),

          // Phone Field
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: '${s.customerPhone} *',
              hintText: '0500000000',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.phone_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return s.customerPhoneRequired;
              }
              if (!RegExp(r'^[0-9+\-\s]+$').hasMatch(value)) {
                return 'رقم الهاتف غير صحيح';
              }
              return null;
            },
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: 16.h),

          // Tax Number Field
          TextFormField(
            controller: _taxNumberController,
            decoration: InputDecoration(
              labelText: s.customerTaxNumber,
              hintText: s.customerTaxNumber,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.receipt_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: 16.h),

          // Commercial Register Field
          TextFormField(
            controller: _commercialRegisterController,
            decoration: InputDecoration(
              labelText: s.customerCommercialRegister,
              hintText: s.customerCommercialRegister,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.description_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: 16.h),

          // Address Field
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(
              labelText: s.customerAddress,
              hintText: s.customerAddress,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            maxLines: 2,
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 16.h),

          // City Field
          TextFormField(
            controller: _cityController,
            decoration: InputDecoration(
              labelText: s.customerCity,
              hintText: s.customerCity,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.location_city_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 16.h),

          // Region Field
          TextFormField(
            controller: _regionController,
            decoration: InputDecoration(
              labelText: s.customerRegion,
              hintText: s.customerRegion,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.map_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 16.h),

          // Postal Code Field
          TextFormField(
            controller: _postalCodeController,
            decoration: InputDecoration(
              labelText: s.customerPostalCode,
              hintText: s.customerPostalCode,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.local_post_office_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            keyboardType: TextInputType.number,
            textDirection: TextDirection.ltr,
          ),

          SizedBox(height: 16.h),

          // Detailed Address Field
          TextFormField(
            controller: _detailedAddressController,
            decoration: InputDecoration(
              labelText: s.customerDetailedAddress,
              hintText: s.customerDetailedAddress,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.home_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            maxLines: 3,
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 24.h),

          // Additional Information Section
          Text(
            s.customerAdditionalInfo,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 16.h),

          // Status Field
          DropdownButtonFormField<String>(
            value: _selectedStatus,
            decoration: InputDecoration(
              labelText: '${s.customerStatus} *',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.flag_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            items: _statusOptions.asMap().entries.map((entry) {
              return DropdownMenuItem(
                value: entry.value,
                child: Text(_statusLabels[entry.key]),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedStatus = value!;
              });
            },
          ),

          SizedBox(height: 16.h),

          // Responsible Person Field
          TextFormField(
            controller: _responsiblePersonController,
            decoration: InputDecoration(
              labelText: s.customerResponsiblePerson,
              hintText: s.customerResponsiblePerson,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.person_pin_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 16.h),

          // Notes Field
          TextFormField(
            controller: _notesController,
            decoration: InputDecoration(
              labelText: s.customerNotes,
              hintText: s.customerNotes,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
              prefixIcon: Icon(
                Icons.note_outlined,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            maxLines: 3,
            textDirection: TextDirection.rtl,
          ),

          SizedBox(height: 24.h),

          // Action Buttons
          Row(
            children: [
              // Cancel Button
              if (widget.onCancel != null)
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onCancel,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(s.cancel),
                  ),
                ),

              if (widget.onCancel != null) SizedBox(width: 12.w),

              // Submit Button
              Expanded(
                child: FilledButton(
                  onPressed: _submitForm,
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    widget.isEditing ? s.editCustomer : s.addCustomer,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        _addressController.text.trim().isEmpty
            ? null
            : _addressController.text.trim(),
        _taxNumberController.text.trim().isEmpty
            ? null
            : _taxNumberController.text.trim(),
        _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        _selectedStatus,
        _companyNameController.text.trim().isEmpty
            ? null
            : _companyNameController.text.trim(),
        _commercialRegisterController.text.trim().isEmpty
            ? null
            : _commercialRegisterController.text.trim(),
        _cityController.text.trim().isEmpty
            ? null
            : _cityController.text.trim(),
        _regionController.text.trim().isEmpty
            ? null
            : _regionController.text.trim(),
        _postalCodeController.text.trim().isEmpty
            ? null
            : _postalCodeController.text.trim(),
        _detailedAddressController.text.trim().isEmpty
            ? null
            : _detailedAddressController.text.trim(),
        _responsiblePersonController.text.trim().isEmpty
            ? null
            : _responsiblePersonController.text.trim(),
      );
    }
  }
}
