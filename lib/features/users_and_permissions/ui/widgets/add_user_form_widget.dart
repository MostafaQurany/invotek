import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/validation/validation.dart';
import 'package:invotek/generated/l10n.dart';

class AddUserFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController phoneController;
  final String selectedRole;
  final String selectedStatus;
  final List<String> roles;
  final List<String> statuses;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final ValueChanged<String> onRoleChanged;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback onPasswordVisibilityToggle;
  final VoidCallback onConfirmPasswordVisibilityToggle;

  const AddUserFormWidget({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.phoneController,
    required this.selectedRole,
    required this.selectedStatus,
    required this.roles,
    required this.statuses,
    required this.isPasswordVisible,
    required this.isConfirmPasswordVisible,
    required this.onRoleChanged,
    required this.onStatusChanged,
    required this.onPasswordVisibilityToggle,
    required this.onConfirmPasswordVisibilityToggle,
  });

  @override
  State<AddUserFormWidget> createState() => _AddUserFormWidgetState();
}

class _AddUserFormWidgetState extends State<AddUserFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Personal Information Section
          _buildSectionTitle(S.of(context).personalInformation),
          SizedBox(height: 16.h),

          // Name Field
          _buildTextField(
            controller: widget.nameController,
            label: S.of(context).fullName,
            hint: S.of(context).enterFullName,
            icon: Icons.person,
            validator: (value) => Validation.validateName(value),
          ),
          SizedBox(height: 16.h),

          // Email Field
          _buildTextField(
            controller: widget.emailController,
            label: S.of(context).email,
            hint: S.of(context).enterEmail,
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => Validation.validateEmail(value),
          ),
          SizedBox(height: 16.h),

          // Phone Field
          _buildTextField(
            controller: widget.phoneController,
            label: S.of(context).phoneNumber,
            hint: S.of(context).enterPhoneNumber,
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            validator: (value) => Validation.validatePhone(value),
          ),
          SizedBox(height: 24.h),

          // Security Information Section
          _buildSectionTitle(S.of(context).securityInformation),
          SizedBox(height: 16.h),

          // Password Field
          _buildPasswordField(
            controller: widget.passwordController,
            label: S.of(context).password,
            hint: S.of(context).enterPassword,
            isVisible: widget.isPasswordVisible,
            onToggleVisibility: widget.onPasswordVisibilityToggle,
            validator: (value) => Validation.validatePassword(value),
          ),
          SizedBox(height: 16.h),

          // Confirm Password Field
          _buildPasswordField(
            controller: widget.confirmPasswordController,
            label: S.of(context).confirmPassword,
            hint: S.of(context).enterPassword,
            isVisible: widget.isConfirmPasswordVisible,
            onToggleVisibility: widget.onConfirmPasswordVisibilityToggle,
            validator: (value) => Validation.validateConfirmPassword(
              value,
              widget.passwordController.text,
            ),
          ),
          SizedBox(height: 24.h),

          // User Settings Section
          _buildSectionTitle(S.of(context).userSettings),
          SizedBox(height: 16.h),

          // Role Dropdown
          _buildDropdown(
            label: S.of(context).role,
            value: widget.selectedRole,
            items: widget.roles,
            onChanged: widget.onRoleChanged,
          ),
          SizedBox(height: 16.h),

          // Status Dropdown
          _buildDropdown(
            label: S.of(context).status,
            value: widget.selectedStatus,
            items: widget.statuses,
            onChanged: widget.onStatusChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(Icons.lock, color: AppColors.primary),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: AppColors.primary,
          ),
          onPressed: onToggleVisibility,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(value: item, child: Text(item));
      }).toList(),
      onChanged: (newValue) => onChanged(newValue!),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.settings, color: AppColors.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
    );
  }
}
