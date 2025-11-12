import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/users_and_permissions/constants/users_permissions.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/cards/user_options_bottom_sheet.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/cards/users_header_widget.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/dialogs/delete_user_dialog.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/lists/users_state_builder.dart';
import 'package:invotek/features/users_and_permissions/utils/user_deletion_helper.dart';
import 'package:invotek/generated/l10n.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({super.key});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class UsersListScreenWithProvider extends StatelessWidget {
  const UsersListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const UsersListScreen();
  }
}

class _UsersListScreenState extends State<UsersListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  String? _selectedRole;
  String? _selectedStatus;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().loadUsers(isRefresh: true);
    _initializeOptions();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Removed FocusScope.of(context).unfocus() to prevent search bar from closing automatically
  }

  void _initializeOptions() {
    _selectedRole = 'all';
    _selectedStatus = 'all';
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Load more when user is 200 pixels from the bottom
      final cubit = context.read<UsersCubit>();
      if (cubit.hasMorePages) {
        cubit.loadMoreUsers(
          search: _searchController.text.isNotEmpty
              ? _searchController.text
              : null,
          role: _selectedRole != 'all' ? _selectedRole : null,
          status: _selectedStatus != 'all' ? _selectedStatus : null,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final canPop = Navigator.of(context).canPop();
          if (canPop) {
            // السماح بالرجوع العادي بدون dialog
            Navigator.of(context).pop();
          } else {
            // فتح zoomDrawer والانتقال إلى home
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                // إغلاق zoomDrawer إذا كان مفتوحاً
                if (zoomDrawer.isOpen()) {
                  zoomDrawer.close();
                }
                // الانتقال إلى home باستخدام NavigationCubit
                context.read<NavigationCubit>().navigateToRoute(
                  AppRoutes.homeRoute,
                );
              } else {
                // Fallback: الانتقال إلى home مباشرة
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              }
            } catch (e) {
              // Fallback: الانتقال إلى home مباشرة
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: BlocListener<UsersCubit, UsersState>(
          listener: (context, state) {
            if (state is UserDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(S.of(context).userDeletedSuccessfully),
                  backgroundColor: AppColors.success,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
            }
          },
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<UsersCubit>().refreshUsers();
            },
            child: Column(
              children: [
                // Header Widget - Scrolls with content
                _buildUsersHeader(),

                // Users List Content
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28.r),
                        topRight: Radius.circular(28.r),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28.r),
                        topRight: Radius.circular(28.r),
                      ),
                      child: UsersStateBuilder(
                        onUserTap: (user) => _showUserOptions(context, user),
                        onUserView: _navigateToUserDetails,
                        onUserEdit: _navigateToEditUser,
                        onUserDelete: _showDeleteConfirmation,
                        onAddUser: _navigateToAddUser,
                        onRetry: _retry,
                        selectedRole: _selectedRole ?? '',
                        selectedStatus: _selectedStatus ?? '',
                        onRoleChanged: _onRoleChanged,
                        onStatusChanged: _onStatusChanged,
                        scrollController: _scrollController,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            final hasCreatePermission = PermissionChecker.hasPermission(
              context,
              UsersPermissions.create,
            );
            return Tooltip(
              message: hasCreatePermission
                  ? S.of(context).addUser
                  : S.of(context).usersNoPermissionToAct,
              child: FloatingActionButton(
                onPressed: hasCreatePermission ? _navigateToAddUser : null,
                backgroundColor: hasCreatePermission
                    ? AppColors.primary
                    : AppColors.greyDark,
                foregroundColor: AppColors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  hasCreatePermission ? Icons.add : Icons.lock_outlined,
                  size: 26.sp,
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      if (query.length >= 2 || query.isEmpty) {
        context.read<UsersCubit>().refreshUsers(
          search: query.isEmpty ? null : query,
          role: _selectedRole != 'all' ? _selectedRole : null,
          status: _selectedStatus != 'all' ? _selectedStatus : null,
        );
      }
    });
  }

  // Helper Methods
  Widget _buildUsersHeader() {
    return UsersHeaderWidget(
      onMenuPressed: _handleMenuPressed,
      searchController: _searchController,
      onSearchChanged: _onSearchChanged,
      selectedRole: _selectedRole ?? '',
      selectedStatus: _selectedStatus ?? '',
      onRoleChanged: _onRoleChanged,
      onStatusChanged: _onStatusChanged,
    );
  }

  // Event Handlers
  void _handleMenuPressed() {
    try {
      final zoomDrawer = ZoomDrawer.of(context);
      if (zoomDrawer != null) {
        zoomDrawer.toggle();
      } else {
        // Fallback navigation if zoom drawer is not available
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
        }
      }
    } catch (e) {
      // Error handling for zoom drawer
      debugPrint('Error toggling zoom drawer: $e');
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    }
  }

  void _onRoleChanged(String? role) {
    if (!mounted) return;
    setState(() => _selectedRole = role);
    context.read<UsersCubit>().refreshUsers(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      role: role != 'all' ? role : null,
      status: _selectedStatus != 'all' ? _selectedStatus : null,
    );
  }

  void _onStatusChanged(String? status) {
    if (!mounted) return;
    setState(() => _selectedStatus = status);
    context.read<UsersCubit>().refreshUsers(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      role: _selectedRole != 'all' ? _selectedRole : null,
      status: status != 'all' ? status : null,
    );
  }

  void _retry() {
    context.read<UsersCubit>().refreshUsers();
  }

  // Navigation Methods
  void _navigateToAddUser() {
    Navigator.pushNamed(context, AppRoutes.addUserRoute);
  }

  void _navigateToUserDetails(User user) async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.userDetailsRoute,
      arguments: user,
    );

    if (result == 'deleted' && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).userDeletedSuccessfully),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }
  }

  void _navigateToEditUser(User user) {
    Navigator.pushNamed(context, AppRoutes.editUserRoute, arguments: user);
  }

  void _showUserOptions(BuildContext context, User user) {
    showModalBottomSheet(
      context: context,
      useSafeArea: false,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      builder: (context) => UserOptionsBottomSheet(
        user: user,
        onViewDetails: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            AppRoutes.userDetailsRoute,
            arguments: user,
          );
        },
        onEdit: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            AppRoutes.editUserRoute,
            arguments: user,
          );
        },
        onDelete: () {
          Navigator.pop(context);
          if (UserDeletionHelper.canDeleteUser(user)) {
            _showDeleteConfirmation(user);
          } else {
            final s = S.of(context);
            final errorMessage = UserDeletionHelper.getDeletionErrorMessage(
              user,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  errorMessage == 'usersCannotDeleteYourselfMessage'
                      ? s.usersCannotDeleteYourselfMessage
                      : s.usersCannotDeleteAdminMessage,
                ),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showDeleteConfirmation(User user) {
    final usersCubit = context.read<UsersCubit>();
    showDialog(
      context: context,
      builder: (context) => DeleteUserDialog(
        user: user,
        onConfirm: () {
          usersCubit.deleteUser(user.id!);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).userDeletedSuccessfully),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          );
        },
      ),
    );
  }
}
