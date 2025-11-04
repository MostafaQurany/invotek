import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/tabs/basic_info_tab.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/core/utils/permission_helper.dart';
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

class _EditUserScreenState extends State<EditUserScreen> {
  final Map<String, String> _validationErrors = {};
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _positionController;

  // Focus nodes for keyboard navigation
  late FocusNode _nameFocus;
  late FocusNode _emailFocus;
  late FocusNode _phoneFocus;
  late FocusNode _positionFocus;

  String _selectedStatus = 'active';

  @override
  void initState() {
    super.initState();

    // Initialize controllers with user data
    _nameController = TextEditingController(text: widget.user.name ?? '');
    _emailController = TextEditingController(text: widget.user.email ?? '');
    _phoneController = TextEditingController(text: widget.user.phone ?? '');
    _positionController = TextEditingController(
      text: widget.user.position ?? '',
    );

    // Initialize focus nodes
    _nameFocus = FocusNode();
    _emailFocus = FocusNode();
    _phoneFocus = FocusNode();
    _positionFocus = FocusNode();

    _selectedStatus = widget.user.status ?? 'active';

    // Add listeners to trigger UI updates
    _nameController.addListener(_onFieldChanged);
    _emailController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    // Remove listeners before disposing
    _nameController.removeListener(_onFieldChanged);
    _emailController.removeListener(_validateEmail);

    // Dispose controllers
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _positionController.dispose();

    // Dispose focus nodes
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _positionFocus.dispose();

    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      // Trigger rebuild to update button state
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
          _validationErrors['email'] = 'Please enter a valid email';
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
      body: ModulePermissionWidget(
        module: 'users',
        action: 'edit',
        fallback: Center(
          child: Text('You do not have permission to edit users'),
        ),
        child: BlocListener<UsersCubit, UsersState>(
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
                    child: BasicInfoTab(
                      nameController: _nameController,
                      emailController: _emailController,
                      phoneController: _phoneController,
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
                      // Focus nodes for keyboard navigation
                      nameFocus: _nameFocus,
                      emailFocus: _emailFocus,
                      phoneFocus: _phoneFocus,
                      positionFocus: _positionFocus,
                      // Callbacks for moving to next field
                      onNameSubmitted: () => _emailFocus.requestFocus(),
                      onEmailSubmitted: () => _phoneFocus.requestFocus(),
                      onPhoneSubmitted: () => _positionFocus.requestFocus(),
                      onPositionSubmitted: () {
                        if (_isFormValid()) {
                          _handleSubmit();
                        } else {
                          _validateForm();
                        }
                      },
                    ),
                  ),
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
      ),
    );
  }

  bool _isFormValid() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();

    // Check required fields are not empty
    if (name.isEmpty || email.isEmpty) {
      return false;
    }

    // Check email format
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return false;
    }

    return true;
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
