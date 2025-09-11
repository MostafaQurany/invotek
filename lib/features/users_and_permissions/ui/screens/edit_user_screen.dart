import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/basic_info_tab.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/permissions_tab.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/profile_tab.dart';
import 'package:invotek/generated/l10n.dart';

class EditUserScreen extends StatefulWidget {
  final User user;

  const EditUserScreen({super.key, required this.user});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class EditUserScreenWithProvider extends StatelessWidget {
  final User user;

  const EditUserScreenWithProvider({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return EditUserScreen(user: user);
  }
}

class _EditUserScreenState extends State<EditUserScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final Map<String, String> _validationErrors = {};

  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _departmentController;
  late TextEditingController _notesController;

  String _selectedStatus = 'active';
  String _selectedRole = 'employee';
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });

    // Initialize controllers with user data
    _nameController = TextEditingController(text: widget.user.name ?? '');
    _emailController = TextEditingController(text: widget.user.email ?? '');
    _phoneController = TextEditingController(text: widget.user.phone ?? '');
    _departmentController = TextEditingController(text: '');
    _notesController = TextEditingController(text: '');

    _selectedStatus = widget.user.status ?? 'active';
    _selectedRole = widget.user.role ?? 'employee';
    _isActive = true;

    // Add listeners to trigger UI updates
    _nameController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();

    // Remove listeners before disposing
    _nameController.removeListener(_onFieldChanged);
    _emailController.removeListener(_onFieldChanged);

    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _departmentController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      // Trigger UI rebuild to update button state
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text('Edit User'),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocListener<UsersCubit, UsersState>(
        listener: (context, state) {
          if (state is UserUpdated) {
            final messenger = ScaffoldMessenger.of(context);
            messenger.hideCurrentSnackBar();
            messenger.showSnackBar(
              SnackBar(
                content: Text('User updated successfully'),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
            Navigator.pop(context);
          } else if (state is UserUpdateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error: ${state.message}'),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
          }
        },
        child: Column(
          children: [
            // Tab Bar
            Container(
              color: AppColors.white,
              child: IgnorePointer(
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: AppColors.primary,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.greyDark,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                  tabs: [
                    Tab(text: s.basicInformation),
                    Tab(text: 'Permissions'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ),
            ),

            // Form Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable swipe navigation
                children: [
                  BasicInfoTab(
                    nameController: _nameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    selectedRole: _selectedRole,
                    selectedStatus: _selectedStatus,
                    onRoleChanged: (value) {
                      setState(() {
                        _selectedRole = value;
                      });
                    },
                    onStatusChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedStatus = value;
                        });
                      }
                    },
                    validationErrors: _validationErrors,
                  ),
                  PermissionsTab(user: widget.user),
                  ProfileTab(
                    departmentController: _departmentController,
                    notesController: _notesController,
                    isActive: _isActive,
                    onActiveChanged: (value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                  ),
                ],
              ),
            ),

            // Bottom Action Buttons
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        side: BorderSide(
                          color: AppColors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        s.cancel,
                        style: TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Save Button
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: _isCurrentTabValid() ? _handleSubmit : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: _isCurrentTabValid()
                            ? AppColors.primary
                            : AppColors.grey.withOpacity(0.3),
                        foregroundColor: _isCurrentTabValid()
                            ? AppColors.white
                            : AppColors.greyDark,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        s.save,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _isCurrentTabValid() {
    switch (_currentTabIndex) {
      case 0: // Basic Info Tab
        return _nameController.text.trim().isNotEmpty &&
            _emailController.text.trim().isNotEmpty;
      case 1: // Permissions Tab
        return true; // No required fields
      case 2: // Profile Tab
        return true; // No required fields
      default:
        return false;
    }
  }

  void _handleSubmit() {
    if (_validateForm()) {
      final cubit = context.read<UsersCubit>();
      cubit.updateUser(
        id: widget.user.id!,
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        role: _selectedRole,
        status: _selectedStatus,
        // department: _departmentController.text.trim().isEmpty
        //     ? null
        //     : _departmentController.text.trim(),
        // notes: _notesController.text.trim().isEmpty
        //     ? null
        //     : _notesController.text.trim(),
        // isActive: _isActive,
      );
    }
  }

  bool _validateForm() {
    setState(() {
      _validationErrors.clear();
    });

    bool isValid = true;

    if (_nameController.text.trim().isEmpty) {
      _validationErrors['name'] = 'Name is required';
      isValid = false;
    }

    if (_emailController.text.trim().isEmpty) {
      _validationErrors['email'] = 'Email is required';
      isValid = false;
    } else if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(_emailController.text.trim())) {
      _validationErrors['email'] = 'Please enter a valid email';
      isValid = false;
    }

    return isValid;
  }
}
