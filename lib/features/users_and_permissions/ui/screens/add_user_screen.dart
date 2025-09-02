import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/users_and_permissions/constants/user_constants.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/mixins/snackbar_mixin.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/add_user_buttons_widget.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/add_user_form_widget.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/add_user_header_widget.dart';
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

class _AddUserScreenState extends State<AddUserScreen> with SnackbarMixin {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedRole = UserConstants.defaultRole;
  String _selectedStatus = UserConstants.defaultStatus;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: _buildAppBar(),
      body: BlocProvider.value(
        value: context.read<UsersCubit>(),
        child: BlocListener<UsersCubit, UsersState>(
          listener: _handleStateChanges,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                const AddUserHeaderWidget(),
                SizedBox(height: 24.h),

                // Form
                AddUserFormWidget(
                  formKey: _formKey,
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  phoneController: _phoneController,
                  selectedRole: _selectedRole,
                  selectedStatus: _selectedStatus,
                  roles: UserConstants.roles,
                  statuses: UserConstants.statuses,
                  isPasswordVisible: _isPasswordVisible,
                  isConfirmPasswordVisible: _isConfirmPasswordVisible,
                  onRoleChanged: _onRoleChanged,
                  onStatusChanged: _onStatusChanged,
                  onPasswordVisibilityToggle: _onPasswordVisibilityToggle,
                  onConfirmPasswordVisibilityToggle:
                      _onConfirmPasswordVisibilityToggle,
                ),
                SizedBox(height: 32.h),

                // Action Buttons
                AddUserButtonsWidget(
                  isLoading: _isLoading,
                  onSubmit: _submitForm,
                  onCancel: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      title: Text(
        S.of(context).addUser,
        style: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      scrolledUnderElevation: 1,
      elevation: 0,
    );
  }

  void _handleStateChanges(BuildContext context, UsersState state) {
    if (state is UserCreating) {
      setState(() => _isLoading = true);
    } else if (state is UserCreated) {
      setState(() => _isLoading = false);
      showUserAddedSuccessSnackBar(context);
      // Refresh the users list before going back
      context.read<UsersCubit>().refreshUsers();
      Navigator.pop(context);
    } else if (state is UserCreationError) {
      setState(() => _isLoading = false);
      showErrorSnackBar(context, state.message);
    } else if (state is UsersListError) {
      setState(() => _isLoading = false);
      showErrorSnackBar(context, state.message);
    } else if (state is UserUpdateError) {
      setState(() => _isLoading = false);
      showErrorSnackBar(context, state.message);
    } else if (state is UserDeletionError) {
      setState(() => _isLoading = false);
      showErrorSnackBar(context, state.message);
    } else if (state is PasswordChangeError) {
      setState(() => _isLoading = false);
      showErrorSnackBar(context, state.message);
    } else if (state is StatisticsError) {
      setState(() => _isLoading = false);
      showErrorSnackBar(context, state.message);
    } else if (state is BulkOperationError) {
      setState(() => _isLoading = false);
      showErrorSnackBar(context, state.message);
    }
  }

  void _onRoleChanged(String role) {
    setState(() => _selectedRole = role);
  }

  void _onStatusChanged(String status) {
    setState(() => _selectedStatus = status);
  }

  void _onPasswordVisibilityToggle() {
    setState(() => _isPasswordVisible = !_isPasswordVisible);
  }

  void _onConfirmPasswordVisibilityToggle() {
    setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      try {
        context.read<UsersCubit>().createUser(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          phone: _phoneController.text.trim(),
          role: _selectedRole,
          status: UserConstants.statusMapping[_selectedStatus] ?? 'active',
        );
      } catch (e) {
        showUserCreationErrorSnackBar(context);
      }
    }
  }
}
