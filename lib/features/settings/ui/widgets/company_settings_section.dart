import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../users_and_permissions/ui/widgets/forms/custom_text_field.dart';

class CompanySettingsSection extends StatefulWidget {
  const CompanySettingsSection({super.key});

  @override
  State<CompanySettingsSection> createState() => _CompanySettingsSectionState();
}

class _CompanySettingsSectionState extends State<CompanySettingsSection> {
  final _companyNameController = TextEditingController();
  final _companyEmailController = TextEditingController();
  final _companyPhoneController = TextEditingController();
  final _companyAddressController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadCompanySettings();
  }

  void _loadCompanySettings() {
    // TODO: Load from API
    _companyNameController.text = 'شركة إنفوتك';
    _companyEmailController.text = 'info@invotek.com';
    _companyPhoneController.text = '+966501234567';
    _companyAddressController.text = 'الرياض، المملكة العربية السعودية';
  }

  Future<void> _saveCompanySettings() async {
    // Basic validation
    if (_companyNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).companyNameRequired),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (_companyEmailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).companyEmailRequired),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (!GetUtils.isEmail(_companyEmailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).companyEmailInvalid),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      // TODO: Save to API
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).settingsSavedSuccessfully),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorMessage('Unknown error')),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // اسم الشركة
        CustomTextField(
          controller: _companyNameController,
          label: S.of(context).companyName,
          hintText: S.of(context).enterCompanyName,
          prefixIcon: Icons.business,
          isRequired: true,
        ),

        SizedBox(height: 16.h),

        // بريد الشركة
        CustomTextField(
          controller: _companyEmailController,
          label: S.of(context).companyEmail,
          hintText: S.of(context).enterCompanyEmail,
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          isRequired: true,
        ),

        SizedBox(height: 16.h),

        // هاتف الشركة
        CustomTextField(
          controller: _companyPhoneController,
          label: S.of(context).companyPhone,
          hintText: S.of(context).enterCompanyPhone,
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          isRequired: true,
        ),

        SizedBox(height: 16.h),

        // عنوان الشركة
        CustomTextField(
          controller: _companyAddressController,
          label: S.of(context).companyAddress,
          hintText: S.of(context).enterCompanyAddress,
          prefixIcon: Icons.location_on,
          maxLines: 2,
          isRequired: true,
        ),

        SizedBox(height: 24.h),

        // زر الحفظ
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _saveCompanySettings,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: _isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.onPrimary,
                      ),
                    ),
                  )
                : Text(
                    S.of(context).saveSettings,
                    style: AppTextTheme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyEmailController.dispose();
    _companyPhoneController.dispose();
    _companyAddressController.dispose();
    super.dispose();
  }
}
