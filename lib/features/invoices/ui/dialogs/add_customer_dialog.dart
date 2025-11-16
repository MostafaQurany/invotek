import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';

class AddCustomerDialog extends StatefulWidget {
  final Function(CustomerModel) onCustomerCreated;

  const AddCustomerDialog({super.key, required this.onCustomerCreated});

  @override
  State<AddCustomerDialog> createState() => _AddCustomerDialogState();
}

class _AddCustomerDialogState extends State<AddCustomerDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _companyNameController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(maxHeight: 600.h),
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            _buildHeader(),
            SizedBox(height: 16.h),

            // Form
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Basic Information
                      _buildSectionTitle(S.of(context).basicInformation),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _nameController,
                        label: S.of(context).customerName,
                        hint: S.of(context).enterCustomerName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).nameRequired;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _emailController,
                        label: S.of(context).customerEmail,
                        hint: S.of(context).enterCustomerEmail,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).emailRequired;
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(value)) {
                            return S.of(context).emailInvalid;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12.h),
                      _buildTextField(
                        controller: _phoneController,
                        label: S.of(context).customerPhone,
                        hint: S.of(context).enterCustomerPhone,
                        keyboardType: TextInputType.phone,
                      ),

                      SizedBox(height: 20.h),

                      // // Company Information
                      // _buildSectionTitle(S.of(context).companyInformation),
                      // SizedBox(height: 12.h),
                      // _buildTextField(
                      //   controller: _companyNameController,
                      //   label: S.of(context).companyName,
                      //   hint: S.of(context).enterCompanyName,
                      // ),
                      // SizedBox(height: 12.h),
                      // _buildTextField(
                      //   controller: _addressController,
                      //   label: S.of(context).address,
                      //   hint: S.of(context).enterAddress,
                      //   maxLines: 2,
                      // ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // Bottom Actions
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.person_add, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            S.of(context).addNewCustomer,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: AppColors.textSecondary, size: 24.sp),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Icon(Icons.info_outline, color: AppColors.primary, size: 20.sp),
        SizedBox(width: 8.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
      ),
    );
  }

  Widget _buildBottomActions() {
    return Column(
      children: [
        // Cancel Button
        OutlinedButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textSecondary,
            side: BorderSide(color: AppColors.border),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: Text(S.of(context).cancel),
        ),
        SizedBox(height: 12.w),
        // Save Button
        ElevatedButton(
          onPressed: _isLoading ? null : _onSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: _isLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(S.of(context).save),
        ),
      ],
    );
  }

  void _onSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Create customer using CustomersCubit
      await context.read<CustomersCubit>().createCustomer(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim().isNotEmpty
            ? _phoneController.text.trim()
            : null,
        address: _addressController.text.trim().isNotEmpty
            ? _addressController.text.trim()
            : null,
        companyName: _companyNameController.text.trim().isNotEmpty
            ? _companyNameController.text.trim()
            : null,
      );

      // Get the created customer from the cubit state
      final customersState = context.read<CustomersCubit>().state;
      customersState.maybeWhen(
        createSuccess:
            (customers, created, selectedCustomer, currentPage, totalPages) {
              widget.onCustomerCreated(created);
              Navigator.pop(context);
            },
        orElse: () {
          // Handle error case
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).errorCreatingCustomer),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).errorCreatingCustomer),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}
