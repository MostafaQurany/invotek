import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/validation/validation.dart';
import 'package:invotek/features/clients/demo/cubit/clients_cubit.dart';
import 'package:invotek/core/di/injection.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class AddClientScreenWithProvider extends StatelessWidget {
  const AddClientScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClientsCubit>(),
      child: const AddClientScreen(),
    );
  }
}

class _AddClientScreenState extends State<AddClientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _companyController = TextEditingController();
  final _taxNumberController = TextEditingController();
  final _websiteController = TextEditingController();
  final _contactPersonController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _contactEmailController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedStatus = 'نشط';
  bool _isLoading = false;

  final List<String> _statuses = ['نشط', 'غير نشط'];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _companyController.dispose();
    _taxNumberController.dispose();
    _websiteController.dispose();
    _contactPersonController.dispose();
    _contactPhoneController.dispose();
    _contactEmailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('إضافة عميل جديد'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        scrolledUnderElevation: 1,
        elevation: 0,
      ),
      body: BlocListener<ClientsCubit, ClientsState>(
        listener: (context, state) {
          if (state.isLoading) {
            setState(() => _isLoading = true);
          } else {
            setState(() => _isLoading = false);

            if (state.error != null) {
              _showErrorSnackBar(state.error!);
              context.read<ClientsCubit>().clearError();
            } else if (!state.isLoading && state.clients.isNotEmpty) {
              // التحقق من أن العميل الجديد تم إضافته
              final lastClient = state.clients.last;
              if (lastClient.name == _nameController.text.trim() &&
                  lastClient.email == _emailController.text.trim()) {
                _showSuccessSnackBar();
                Navigator.pop(context);
              }
            }
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                _buildHeader(),
                SizedBox(height: 24.h),

                // Basic Information Section
                _buildSectionTitle('المعلومات الأساسية'),
                SizedBox(height: 16.h),

                // Name Field
                _buildTextField(
                  controller: _nameController,
                  label: 'اسم العميل',
                  hint: 'أدخل اسم العميل',
                  icon: Icons.person,
                  validator: (value) => Validation.validateName(value),
                ),
                SizedBox(height: 16.h),

                // Email Field
                _buildTextField(
                  controller: _emailController,
                  label: 'البريد الإلكتروني',
                  hint: 'أدخل البريد الإلكتروني',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validation.validateEmail(value),
                ),
                SizedBox(height: 16.h),

                // Phone Field
                _buildTextField(
                  controller: _phoneController,
                  label: 'رقم الهاتف',
                  hint: 'أدخل رقم الهاتف',
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (value) => Validation.validatePhone(value),
                ),
                SizedBox(height: 16.h),

                // Address Field
                _buildTextField(
                  controller: _addressController,
                  label: 'العنوان',
                  hint: 'أدخل عنوان العميل',
                  icon: Icons.location_on,
                  maxLines: 3,
                ),
                SizedBox(height: 24.h),

                // Company Information Section
                _buildSectionTitle('معلومات الشركة'),
                SizedBox(height: 16.h),

                // Company Field
                _buildTextField(
                  controller: _companyController,
                  label: 'اسم الشركة',
                  hint: 'أدخل اسم الشركة',
                  icon: Icons.business,
                ),
                SizedBox(height: 16.h),

                // Tax Number Field
                _buildTextField(
                  controller: _taxNumberController,
                  label: 'الرقم الضريبي',
                  hint: 'أدخل الرقم الضريبي',
                  icon: Icons.receipt,
                ),
                SizedBox(height: 16.h),

                // Website Field
                _buildTextField(
                  controller: _websiteController,
                  label: 'الموقع الإلكتروني',
                  hint: 'أدخل الموقع الإلكتروني',
                  icon: Icons.web,
                  keyboardType: TextInputType.url,
                ),
                SizedBox(height: 24.h),

                // Contact Person Section
                _buildSectionTitle('معلومات شخص الاتصال'),
                SizedBox(height: 16.h),

                // Contact Person Field
                _buildTextField(
                  controller: _contactPersonController,
                  label: 'اسم شخص الاتصال',
                  hint: 'أدخل اسم شخص الاتصال',
                  icon: Icons.contact_phone,
                ),
                SizedBox(height: 16.h),

                // Contact Phone Field
                _buildTextField(
                  controller: _contactPhoneController,
                  label: 'هاتف شخص الاتصال',
                  hint: 'أدخل هاتف شخص الاتصال',
                  icon: Icons.phone_android,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 16.h),

                // Contact Email Field
                _buildTextField(
                  controller: _contactEmailController,
                  label: 'بريد شخص الاتصال',
                  hint: 'أدخل بريد شخص الاتصال',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 24.h),

                // Additional Information Section
                _buildSectionTitle('معلومات إضافية'),
                SizedBox(height: 16.h),

                // Status Dropdown
                _buildDropdown(
                  label: 'الحالة',
                  value: _selectedStatus,
                  items: _statuses,
                  onChanged: (value) {
                    setState(() => _selectedStatus = value!);
                  },
                ),
                SizedBox(height: 16.h),

                // Notes Field
                _buildTextField(
                  controller: _notesController,
                  label: 'ملاحظات',
                  hint: 'أدخل ملاحظات إضافية',
                  icon: Icons.note,
                  maxLines: 4,
                ),
                SizedBox(height: 32.h),

                // Submit Button
                _buildSubmitButton(),
                SizedBox(height: 16.h),

                // Cancel Button
                _buildCancelButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colorScheme.primary.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.person_add, color: colorScheme.primary, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'إضافة عميل جديد',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'املأ النموذج أدناه لإضافة عميل جديد للنظام',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    final colorScheme = Theme.of(context).colorScheme;

    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: colorScheme.primary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    int? maxLines,
    String? Function(String?)? validator,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: colorScheme.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        filled: true,
        fillColor: colorScheme.surfaceContainer,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return DropdownButtonFormField<String>(
      initialValue: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.settings, color: colorScheme.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        filled: true,
        fillColor: colorScheme.surfaceContainer,
      ),
    );
  }

  Widget _buildSubmitButton() {
    final colorScheme = Theme.of(context).colorScheme;

    return FilledButton(
      onPressed: _isLoading ? null : _submitForm,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: _isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  colorScheme.onPrimary,
                ),
              ),
            )
          : Text(
              'إضافة العميل',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
    );
  }

  Widget _buildCancelButton() {
    final colorScheme = Theme.of(context).colorScheme;

    return OutlinedButton(
      onPressed: _isLoading ? null : () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        side: BorderSide(color: colorScheme.primary),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      child: Text(
        'إلغاء',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      try {
        context.read<ClientsCubit>().createClient(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          phone: _phoneController.text.trim().isEmpty
              ? null
              : _phoneController.text.trim(),
          address: _addressController.text.trim().isEmpty
              ? null
              : _addressController.text.trim(),
          company: _companyController.text.trim().isEmpty
              ? null
              : _companyController.text.trim(),
          taxNumber: _taxNumberController.text.trim().isEmpty
              ? null
              : _taxNumberController.text.trim(),
          website: _websiteController.text.trim().isEmpty
              ? null
              : _websiteController.text.trim(),
          contactPerson: _contactPersonController.text.trim().isEmpty
              ? null
              : _contactPersonController.text.trim(),
          contactPhone: _contactPhoneController.text.trim().isEmpty
              ? null
              : _contactPhoneController.text.trim(),
          contactEmail: _contactEmailController.text.trim().isEmpty
              ? null
              : _contactEmailController.text.trim(),
          notes: _notesController.text.trim().isEmpty
              ? null
              : _notesController.text.trim(),
          status: _selectedStatus == 'نشط' ? 'active' : 'inactive',
        );
      } catch (e) {
        _showErrorSnackBar('حدث خطأ أثناء إنشاء العميل: $e');
      }
    }
  }

  void _showErrorSnackBar(String error) {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: colorScheme.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }

  void _showSuccessSnackBar() {
    final colorScheme = Theme.of(context).colorScheme;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('تم إضافة العميل بنجاح'),
        backgroundColor: colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
    );
  }
}
