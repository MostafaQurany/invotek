import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/add_user_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/users_app_bar_widget.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/users_delete_dialog.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/users_header_widget.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/users_list_widget.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/users_search_filter_widget.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/users_state_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class UsersPermissionsScreen extends StatefulWidget {
  const UsersPermissionsScreen({super.key});

  @override
  State<UsersPermissionsScreen> createState() => _UsersPermissionsScreenState();
}

class UsersPermissionsScreenWithProvider extends StatelessWidget {
  const UsersPermissionsScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<UsersCubit>(),
      child: const UsersPermissionsScreen(),
    );
  }
}

class _UsersPermissionsScreenState extends State<UsersPermissionsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  String _searchQuery = '';
  String _statusFilter = 'all';
  String _roleFilter = 'all';
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasTriggeredInitialLoad = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Add a small delay to prevent multiple rapid calls
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          _loadMoreData();
        }
      });
    }
  }

  void _loadMoreData() {
    final cubit = context.read<UsersCubit>();
    if (!_isLoadingMore && cubit.hasMorePages) {
      setState(() {
        _isLoadingMore = true;
      });

      context
          .read<UsersCubit>()
          .loadUsers(
            search: _searchQuery.isEmpty ? null : _searchQuery,
            role: _roleFilter == 'all' ? null : _roleFilter,
            status: _statusFilter == 'all' ? null : _statusFilter,
            page: _currentPage + 1,
            limit: 20,
          )
          .then((_) {
            if (mounted) {
              setState(() {
                _isLoadingMore = false;
                _currentPage++;
              });
            }
          })
          .catchError((error) {
            if (mounted) {
              setState(() {
                _isLoadingMore = false;
              });
            }
          });
    }
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 1;
    });

    context.read<UsersCubit>().loadUsers(
      search: query.isEmpty ? null : query,
      role: _roleFilter == 'all' ? null : _roleFilter,
      status: _statusFilter == 'all' ? null : _statusFilter,
      page: 1,
      limit: 20,
    );
  }

  void _onStatusFilterChanged(String status) {
    setState(() {
      _statusFilter = status;
      _currentPage = 1;
    });

    context.read<UsersCubit>().loadUsers(
      search: _searchQuery.isEmpty ? null : _searchQuery,
      role: _roleFilter == 'all' ? null : _roleFilter,
      status: status == 'all' ? null : status,
      page: 1,
      limit: 20,
    );
  }

  void _onRoleFilterChanged(String role) {
    setState(() {
      _roleFilter = role;
      _currentPage = 1;
    });

    context.read<UsersCubit>().loadUsers(
      search: _searchQuery.isEmpty ? null : _searchQuery,
      role: role == 'all' ? null : role,
      status: _statusFilter == 'all' ? null : _statusFilter,
      page: 1,
      limit: 20,
    );
  }

  void _toggleMenu() {
    // Check if we're in a ZoomDrawer context
    try {
      final zoomDrawer = ZoomDrawer.of(context);
      if (zoomDrawer != null) {
        zoomDrawer.toggle();
      } else {
        // If not in ZoomDrawer, navigate back or to home
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      }
    } catch (e) {
      // Fallback: navigate back or to home
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  void _onPermissionsPressed() {
    Navigator.pushNamed(context, '/users/permissions');
  }

  void _onAddUserPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddUserScreenWithProvider(),
      ),
    );
  }

  void _onUserDelete(User user) {
    showDialog(
      context: context,
      builder: (context) => UsersDeleteDialog(
        user: user,
        onDelete: () => context.read<UsersCubit>().deleteUser(user.id!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is UsersListError) {
          SnackBarHelper.showFailureSnackBar(context, state.failure);
        } else if (state is UserCreationError) {
          SnackBarHelper.showFailureSnackBar(context, state.failure);
        } else if (state is UserUpdateError) {
          SnackBarHelper.showFailureSnackBar(context, state.failure);
        } else if (state is UserDeletionError) {
          SnackBarHelper.showFailureSnackBar(context, state.failure);
        } else if (state is PasswordChangeError) {
          SnackBarHelper.showFailureSnackBar(context, state.failure);
        } else if (state is StatisticsError) {
          SnackBarHelper.showFailureSnackBar(context, state.failure);
        } else if (state is BulkOperationError) {
          SnackBarHelper.showFailureSnackBar(context, state.failure);
        } else if (state is UserCreated) {
          final s = S.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(s.userCreatedSuccessfullyMessage),
              backgroundColor: colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
          // Refresh the users list to show the new user
          context.read<UsersCubit>().refreshUsers();
        } else if (state is UserUpdated) {
          final s = S.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(s.userUpdatedSuccessfullyMessage),
              backgroundColor: colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state is UserDeleted) {
          final s = S.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(s.userDeletedSuccessfullyMessage),
              backgroundColor: colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state is PasswordChanged) {
          final s = S.of(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(s.passwordChangedSuccessfully),
              backgroundColor: colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        } else if (state is BulkOperationCompleted) {
          final s = S.of(context);
          final operationText = _getLocalizedOperation(context, state.operation);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$operationText ${s.completedSuccessfully}'),
              backgroundColor: colorScheme.primary,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          // Load data only if it's the first time and we haven't triggered it yet
          if (!_hasTriggeredInitialLoad &&
              (state is UsersInitial || state is UsersListError) &&
              !context.read<UsersCubit>().hasInitialData) {
            _hasTriggeredInitialLoad = true;
            _currentPage = 1; // Reset page on initial load
            Future.microtask(() {
              context.read<UsersCubit>().loadUsers(page: 1, limit: 20);
            });
          }

          return Scaffold(
            backgroundColor: colorScheme.surface,
            appBar: UsersAppBarWidget(
              onMenuPressed: _toggleMenu,
              onNotificationPressed: () {
                // TODO: Add notifications
              },
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                _currentPage = 1; // Reset page on refresh
                await context.read<UsersCubit>().refreshUsers();
              },
              child: Column(
                children: [
                  UsersHeaderWidget(
                    onPermissionsPressed: _onPermissionsPressed,
                  ),
                  UsersSearchFilterWidget(
                    searchController: _searchController,
                    statusFilter: _statusFilter,
                    roleFilter: _roleFilter,
                    onSearchChanged: _onSearchChanged,
                    onStatusFilterChanged: _onStatusFilterChanged,
                    onRoleFilterChanged: _onRoleFilterChanged,
                  ),
                  Expanded(child: _buildBody(state)),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _onAddUserPressed,
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(UsersState state) {
    if (state is UsersListLoading) {
      return const UsersLoadingWidget();
    }

    if (state is UsersListError) {
      return UsersErrorWidget(
        error: state.failure.message,
        onRetry: () => context.read<UsersCubit>().loadUsers(page: 1, limit: 20),
      );
    }

    if (state is UsersListLoaded) {
      if (state.users.isEmpty) {
        return const UsersEmptyWidget();
      }

      return UsersListWidget(
        users: state.users,
        scrollController: _scrollController,
        isLoadingMore: _isLoadingMore,
        onUserDelete: _onUserDelete,
      );
    }

    final userList = context.read<UsersCubit>().users;
    if (userList.isEmpty) {
      return const UsersEmptyWidget();
    } else {
      return UsersListWidget(
        users: userList,
        scrollController: _scrollController,
        isLoadingMore: _isLoadingMore,
        onUserDelete: _onUserDelete,
      );
    }
  }

  String _getLocalizedOperation(BuildContext context, String operation) {
    final s = S.of(context);
    final operationLower = operation.toLowerCase();
    if (operationLower == 'delete' || operationLower == 'حذف') {
      return s.operationDelete;
    } else if (operationLower == 'status_update' || 
               operationLower == 'تحديث الحالة') {
      return s.operationStatusUpdate;
    } else if (operationLower == 'bulk_delete' || 
               operationLower == 'الحذف المجمع') {
      return s.operationBulkDelete;
    } else if (operationLower == 'bulk_status_update' || 
               operationLower == 'تحديث الحالة المجمع') {
      return s.operationBulkStatusUpdate;
    }
    return operation;
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
