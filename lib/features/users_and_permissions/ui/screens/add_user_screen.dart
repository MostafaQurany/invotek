import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/basic_info_tab.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/users_and_permissions/constants/users_permissions.dart';

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

class _AddUserScreenState extends State<AddUserScreen> {
  final Map<String, String> _validationErrors = {};
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneController;
  late TextEditingController _positionController;

  // Focus nodes for keyboard navigation
  late FocusNode _nameFocus;
  late FocusNode _emailFocus;
  late FocusNode _phoneFocus;
  late FocusNode _positionFocus;
  late FocusNode _passwordFocus;
  late FocusNode _confirmPasswordFocus;

  String _selectedStatus = 'active';
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneController = TextEditingController();
    _positionController = TextEditingController();

    // Initialize focus nodes
    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
    _phoneFocus = FocusNode();
    _positionFocus = FocusNode();
    _passwordFocus = FocusNode();
    _confirmPasswordFocus = FocusNode();

    // Add listeners to trigger UI updates
    _nameController.addListener(_onFieldChanged);
    _emailController.addListener(_validateEmail);
    _passwordController.addListener(_onFieldChanged);
    _passwordController.addListener(_validatePassword);
    _confirmPasswordController.addListener(_onFieldChanged);
    _confirmPasswordController.addListener(_validatePassword);
  }

  @override
  void dispose() {
    // Remove listeners before disposing
    _nameController.removeListener(_onFieldChanged);
    _emailController.removeListener(_validateEmail);
    _passwordController.removeListener(_onFieldChanged);
    _passwordController.removeListener(_validatePassword);
    _confirmPasswordController.removeListener(_onFieldChanged);
    _confirmPasswordController.removeListener(_validatePassword);

    // Dispose controllers
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _positionController.dispose();

    // Dispose focus nodes
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _positionFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();

    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      // Trigger rebuild to update button state
    });
  }

  void _validatePassword() {
    setState(() {
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();

      // Clear previous password errors
      _validationErrors.remove('password');
      _validationErrors.remove('confirmPassword');

      // Validate password length
      if (password.isNotEmpty && password.length < 6) {
        _validationErrors['password'] = S.of(context).usersPasswordMustBeAtLeast6Characters;
      }

      // Validate password match (only if both fields have values)
      if (password.isNotEmpty && confirmPassword.isNotEmpty && password != confirmPassword) {
        _validationErrors['confirmPassword'] = S.of(context).usersPasswordsDoNotMatch;
      }
    });
  }

  void _validateEmail() {
    setState(() {
      final email = _emailController.text.trim();
      
      // Clear previous email error
      _validationErrors.remove('email');

      if (email.isNotEmpty) {
        final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
        if (!emailRegex.hasMatch(email)) {
          _validationErrors['email'] = S.of(context).usersPleaseEnterValidEmail;
        }
      }
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
      body: PermissionWidget(
        permission: UsersPermissions.create,
        fallback: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 64.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              Text(
                s.usersNoPermissionToView,
                style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                s.usersNoPermissionToAct,
                style: TextStyle(fontSize: 14.sp, color: AppColors.greyDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        child: BlocListener<UsersCubit, UsersState>(
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
              // Form Content
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: _buildBasicInfoTab(),
                  ),
                ),
              ),

              // Bottom Action Buttons
              Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 16.w,
                  bottom: 16.w + MediaQuery.of(context).padding.bottom,
                ),
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
                        onPressed: _isFormValid() ? _handleSubmit : null,
                        style: FilledButton.styleFrom(
                          backgroundColor: _isFormValid()
                              ? AppColors.primary
                              : AppColors.grey.withOpacity(0.3),
                          foregroundColor: _isFormValid()
                              ? AppColors.white
                              : AppColors.greyDark,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          s.addUser,
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
      positionController: _positionController,
      selectedStatus: _selectedStatus,
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
      // Focus nodes for keyboard navigation
      nameFocus: _nameFocus,
      emailFocus: _emailFocus,
      phoneFocus: _phoneFocus,
      positionFocus: _positionFocus,
      passwordFocus: _passwordFocus,
      confirmPasswordFocus: _confirmPasswordFocus,
      // Callbacks for moving to next field
      onNameSubmitted: () => _emailFocus.requestFocus(),
      onEmailSubmitted: () => _phoneFocus.requestFocus(),
      onPhoneSubmitted: () => _positionFocus.requestFocus(),
      onPositionSubmitted: () => _passwordFocus.requestFocus(),
      onPasswordSubmitted: () => _confirmPasswordFocus.requestFocus(),
      onConfirmPasswordSubmitted: () {
        if (_isFormValid()) {
          _handleSubmit();
        } else {
          _validateForm();
        }
      },
    );
  }

  bool _isFormValid() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // Check required fields are not empty
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return false;
    }

    // Check email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return false;
    }

    // Check password length (minimum 6 characters)
    if (password.length < 6) {
      return false;
    }

    // Check passwords match
    if (password != confirmPassword) {
      return false;
    }

    return true;
  }

  void _handleSubmit() {
    if (_validateForm()) {
      final cubit = context.read<UsersCubit>();
      cubit.createUser(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
        passwordConfirmation: _confirmPasswordController.text,
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        position: _positionController.text.trim().isEmpty
            ? null
            : _positionController.text.trim(),
        status: _selectedStatus,
      );
    }
  }

  bool _validateForm() {
    setState(() {
      _validationErrors.clear();
    });

    bool isValid = true;

    final s = S.of(context);
    if (_nameController.text.trim().isEmpty) {
      _validationErrors['name'] = s.usersNameRequired;
      isValid = false;
    }

    if (_emailController.text.trim().isEmpty) {
      _validationErrors['email'] = s.usersEmailRequired;
      isValid = false;
    } else if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(_emailController.text.trim())) {
      _validationErrors['email'] = s.usersPleaseEnterValidEmail;
      isValid = false;
    }

    if (_passwordController.text.trim().isEmpty) {
      _validationErrors['password'] = s.usersPasswordRequired;
      isValid = false;
    } else if (_passwordController.text.length < 6) {
      _validationErrors['password'] = s.usersPasswordMustBeAtLeast6Characters;
      isValid = false;
    }

    if (_confirmPasswordController.text.trim().isEmpty) {
      _validationErrors['confirmPassword'] = s.usersPleaseConfirmYourPassword;
      isValid = false;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _validationErrors['confirmPassword'] = s.usersPasswordsDoNotMatch;
      isValid = false;
    }

    return isValid;
  }
}
