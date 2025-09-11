import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';

class PermissionsTab extends StatefulWidget {
  final User user;

  const PermissionsTab({super.key, required this.user});

  @override
  State<PermissionsTab> createState() => _PermissionsTabState();
}

class _PermissionsTabState extends State<PermissionsTab> {
  final Map<String, bool> _permissions = {
    'view_users': false,
    'create_users': false,
    'edit_users': false,
    'delete_users': false,
    'view_products': false,
    'create_products': false,
    'edit_products': false,
    'delete_products': false,
    'view_customers': false,
    'create_customers': false,
    'edit_customers': false,
    'delete_customers': false,
    'view_expenses': false,
    'create_expenses': false,
    'edit_expenses': false,
    'delete_expenses': false,
    'view_reports': false,
    'manage_settings': false,
  };

  @override
  void initState() {
    super.initState();
    _loadUserPermissions();
  }

  void _loadUserPermissions() {
    // Load user permissions from the user object
    // This would typically come from the user's permissions data
    // For now, we'll set some default values based on role
    final role = widget.user.role?.toLowerCase();
    switch (role) {
      case 'admin':
        _permissions.updateAll((key, value) => true);
        break;
      case 'manager':
        _permissions.updateAll((key, value) => true);
        _permissions['manage_settings'] = false;
        break;
      case 'employee':
        _permissions['view_users'] = true;
        _permissions['view_products'] = true;
        _permissions['create_products'] = true;
        _permissions['edit_products'] = true;
        _permissions['view_customers'] = true;
        _permissions['create_customers'] = true;
        _permissions['edit_customers'] = true;
        _permissions['view_expenses'] = true;
        _permissions['create_expenses'] = true;
        _permissions['view_reports'] = true;
        break;
      case 'viewer':
        _permissions['view_users'] = true;
        _permissions['view_products'] = true;
        _permissions['view_customers'] = true;
        _permissions['view_expenses'] = true;
        _permissions['view_reports'] = true;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Permissions Section
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
                        color: AppColors.warning.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Icon(
                        Icons.security_outlined,
                        color: AppColors.warning,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      'User Permissions',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 24.h),

                // Permissions Groups
                _buildPermissionGroup(
                  title: 'User Management',
                  permissions: [
                    {'key': 'view_users', 'label': 'View Users'},
                    {'key': 'create_users', 'label': 'Create Users'},
                    {'key': 'edit_users', 'label': 'Edit Users'},
                    {'key': 'delete_users', 'label': 'Delete Users'},
                  ],
                ),

                SizedBox(height: 24.h),

                _buildPermissionGroup(
                  title: 'Product Management',
                  permissions: [
                    {'key': 'view_products', 'label': 'View Products'},
                    {'key': 'create_products', 'label': 'Create Products'},
                    {'key': 'edit_products', 'label': 'Edit Products'},
                    {'key': 'delete_products', 'label': 'Delete Products'},
                  ],
                ),

                SizedBox(height: 24.h),

                _buildPermissionGroup(
                  title: 'Customer Management',
                  permissions: [
                    {'key': 'view_customers', 'label': 'View Customers'},
                    {'key': 'create_customers', 'label': 'Create Customers'},
                    {'key': 'edit_customers', 'label': 'Edit Customers'},
                    {'key': 'delete_customers', 'label': 'Delete Customers'},
                  ],
                ),

                SizedBox(height: 24.h),

                _buildPermissionGroup(
                  title: 'Expense Management',
                  permissions: [
                    {'key': 'view_expenses', 'label': 'View Expenses'},
                    {'key': 'create_expenses', 'label': 'Create Expenses'},
                    {'key': 'edit_expenses', 'label': 'Edit Expenses'},
                    {'key': 'delete_expenses', 'label': 'Delete Expenses'},
                  ],
                ),

                SizedBox(height: 24.h),

                _buildPermissionGroup(
                  title: 'System Access',
                  permissions: [
                    {'key': 'view_reports', 'label': 'View Reports'},
                    {'key': 'manage_settings', 'label': 'Manage Settings'},
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionGroup({
    required String title,
    required List<Map<String, String>> permissions,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        ...permissions.map(
          (permission) => _buildPermissionItem(
            key: permission['key']!,
            label: permission['label']!,
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionItem({required String key, required String label}) {
    final isEnabled = _permissions[key] ?? false;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Switch(
            value: isEnabled,
            onChanged: (value) {
              setState(() {
                _permissions[key] = value;
              });
            },
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
