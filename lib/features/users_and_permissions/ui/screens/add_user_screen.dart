import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/basic_info_tab.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/permissions_tab.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/profile_tab.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/generated/l10n.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class AddUserScreenWithProvider extends StatelessWidget {
  const AddUserScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddUserScreen();
  }
}

class _AddUserScreenState extends State<AddUserScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final Map<String, String> _validationErrors = {};

  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneController;
  late TextEditingController _departmentController;
  late TextEditingController _notesController;

  String _selectedStatus = 'active';
  String _selectedRole = 'employee';
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
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

    // Initialize controllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneController = TextEditingController();
    _departmentController = TextEditingController();
    _notesController = TextEditingController();

    // Add listeners to trigger UI updates
    _nameController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
    _passwordController.addListener(_onFieldChanged);
    _confirmPasswordController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();

    // Remove listeners before disposing
    _nameController.removeListener(_onFieldChanged);
    _emailController.removeListener(_onFieldChanged);
    _passwordController.removeListener(_onFieldChanged);
    _confirmPasswordController.removeListener(_onFieldChanged);

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _departmentController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      // Clear validation errors for current tab when user starts typing
      if (_currentTabIndex == 0) {
        _validationErrors.clear();
      }
      // Trigger UI rebuild to update button state
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.addUser),
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
          if (state is UserCreated) {
            final messenger = ScaffoldMessenger.of(context);
            messenger.hideCurrentSnackBar();
            messenger.showSnackBar(
              SnackBar(
                content: Text(S.of(context).userCreatedSuccessfully),
                backgroundColor: AppColors.primary,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
            Navigator.pop(context);
          } else if (state is UserCreationError) {
            SnackBarHelper.showFailureSnackBar(context, state.failure);
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
                  _buildBasicInfoTab(),
                  PermissionsTab(
                    user: User(
                      id: null,
                      name: '',
                      email: '',
                      phone: '',
                      role: 'employee',
                      status: 'active',
                      createdAt: DateTime.now().toIso8601String(),
                    ),
                  ), // Empty user for new user
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

                  // Previous Button (only show if not on first tab)
                  if (_currentTabIndex > 0) ...[
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _goToPreviousTab,
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          side: BorderSide(color: AppColors.primary),
                        ),
                        child: Text(
                          'Previous',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                  ],

                  // Next/Save Button
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: _isCurrentTabValid()
                          ? _handleNextOrSubmit
                          : null,
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
                        _currentTabIndex == 2 ? s.addUser : 'Next',
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

  Widget _buildBasicInfoTab() {
    return BasicInfoTab(
      nameController: _nameController,
      emailController: _emailController,
      phoneController: _phoneController,
      passwordController: _passwordController,
      confirmPasswordController: _confirmPasswordController,
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
      showPasswordFields: true,
      isPasswordVisible: _isPasswordVisible,
      isConfirmPasswordVisible: _isConfirmPasswordVisible,
      onPasswordVisibilityToggle: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
      onConfirmPasswordVisibilityToggle: () {
        setState(() {
          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
        });
      },
    );
  }

  bool _isCurrentTabValid() {
    switch (_currentTabIndex) {
      case 0: // Basic Info Tab
        return _nameController.text.trim().isNotEmpty &&
            _emailController.text.trim().isNotEmpty &&
            _passwordController.text.trim().isNotEmpty &&
            _confirmPasswordController.text.trim().isNotEmpty &&
            _passwordController.text == _confirmPasswordController.text;
      case 1: // Permissions Tab
        return true; // No required fields
      case 2: // Profile Tab
        return true; // No required fields
      default:
        return false;
    }
  }

  void _handleNextOrSubmit() {
    if (_currentTabIndex < 2) {
      // Validate current tab before proceeding
      if (_validateCurrentTab()) {
        _goToNextTab();
      }
    } else {
      // Submit the form
      _handleSubmit();
    }
  }

  bool _validateCurrentTab() {
    if (_currentTabIndex == 0) {
      // Validate basic info tab
      return _validateBasicInfoTab();
    }
    return true; // Other tabs don't have required validation
  }

  bool _validateBasicInfoTab() {
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

    if (_passwordController.text.trim().isEmpty) {
      _validationErrors['password'] = 'Password is required';
      isValid = false;
    } else if (_passwordController.text.length < 6) {
      _validationErrors['password'] = 'Password must be at least 6 characters';
      isValid = false;
    }

    if (_confirmPasswordController.text.trim().isEmpty) {
      _validationErrors['confirmPassword'] = 'Please confirm your password';
      isValid = false;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _validationErrors['confirmPassword'] = 'Passwords do not match';
      isValid = false;
    }

    return isValid;
  }

  void _goToNextTab() {
    if (_currentTabIndex < 2) {
      setState(() {
        _currentTabIndex++;
        _tabController.animateTo(_currentTabIndex);
      });
    }
  }

  void _goToPreviousTab() {
    if (_currentTabIndex > 0) {
      setState(() {
        _currentTabIndex--;
        _tabController.animateTo(_currentTabIndex);
      });
    }
  }

  void _handleSubmit() {
    if (_validateForm()) {
      final cubit = context.read<UsersCubit>();
      cubit.createUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
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

    if (_passwordController.text.trim().isEmpty) {
      _validationErrors['password'] = 'Password is required';
      isValid = false;
    } else if (_passwordController.text.length < 6) {
      _validationErrors['password'] = 'Password must be at least 6 characters';
      isValid = false;
    }

    if (_confirmPasswordController.text.trim().isEmpty) {
      _validationErrors['confirmPassword'] = 'Please confirm your password';
      isValid = false;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _validationErrors['confirmPassword'] = 'Passwords do not match';
      isValid = false;
    }

    return isValid;
  }
}
