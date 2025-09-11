import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/forms/role_dropdown.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/forms/status_dropdown.dart';
import 'package:invotek/generated/l10n.dart';

class BasicInfoTab extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final String selectedRole;
  final String selectedStatus;
  final ValueChanged<String> onRoleChanged;
  final ValueChanged<String?> onStatusChanged;
  final Map<String, String> validationErrors;
  final bool showPasswordFields;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final VoidCallback? onPasswordVisibilityToggle;
  final VoidCallback? onConfirmPasswordVisibilityToggle;

  const BasicInfoTab({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    this.passwordController,
    this.confirmPasswordController,
    required this.selectedRole,
    required this.selectedStatus,
    required this.onRoleChanged,
    required this.onStatusChanged,
    required this.validationErrors,
    this.showPasswordFields = false,
    this.isPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
    this.onPasswordVisibilityToggle,
    this.onConfirmPasswordVisibilityToggle,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Basic Information Section
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Header
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.person_outline,
                        color: AppColors.primary,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      s.basicInformation,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                // Name Field
                CustomTextField(
                  controller: nameController,
                  label: s.fullName,
                  hintText: s.enterFullName,
                  prefixIcon: Icons.person_outline,
                  errorText: validationErrors['name'],
                  isRequired: true,
                ),

                SizedBox(height: 16.h),

                // Email Field
                CustomTextField(
                  controller: emailController,
                  label: 'Email Address',
                  hintText: 'Enter email address',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  errorText: validationErrors['email'],
                  isRequired: true,
                ),

                SizedBox(height: 16.h),

                // Phone Field
                CustomTextField(
                  controller: phoneController,
                  label: s.phoneNumber,
                  hintText: s.enterPhoneNumber,
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                ),

                if (showPasswordFields && passwordController != null) ...[
                  SizedBox(height: 16.h),

                  // Password Field
                  CustomTextField(
                    controller: passwordController!,
                    label: s.password,
                    hintText: s.enterPassword,
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isPasswordVisible,
                    suffixIcon: isPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onSuffixPressed: onPasswordVisibilityToggle,
                    errorText: validationErrors['password'],
                    isRequired: true,
                  ),

                  SizedBox(height: 16.h),

                  // Confirm Password Field
                  CustomTextField(
                    controller: confirmPasswordController!,
                    label: s.confirmPassword,
                    hintText: 'Confirm password',
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isConfirmPasswordVisible,
                    suffixIcon: isConfirmPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    onSuffixPressed: onConfirmPasswordVisibilityToggle,
                    errorText: validationErrors['confirmPassword'],
                    isRequired: true,
                  ),
                ],

                SizedBox(height: 24.h),

                // Role and Status Row
                Row(
                  children: [
                    // Role Dropdown
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.role,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          RoleDropdown(
                            value: selectedRole,
                            onChanged: (value) {
                              if (value != null) {
                                onRoleChanged(value);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),

                    // Status Dropdown
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.status,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          StatusDropdown(
                            value: selectedStatus,
                            onChanged: onStatusChanged,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
