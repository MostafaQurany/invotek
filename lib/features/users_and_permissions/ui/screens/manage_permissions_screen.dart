import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/users_and_permissions/data/models/permission_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_state.dart';
import 'package:invotek/generated/l10n.dart';

class ManagePermissionsScreen extends StatefulWidget {
  const ManagePermissionsScreen({super.key});

  @override
  State<ManagePermissionsScreen> createState() =>
      _ManagePermissionsScreenState();
}

class ManagePermissionsScreenWithProvider extends StatelessWidget {
  const ManagePermissionsScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PermissionsCubit>(),
      child: const ManagePermissionsScreen(),
    );
  }
}

class _ManagePermissionsScreenState extends State<ManagePermissionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedModule = 'users';

  final List<String> _modules = [
    'users',
    'clients',
    'products',
    'invoices',
    'expenses',
    'reports',
    'settings',
  ];

  final Map<String, String> _moduleNames = {
    'users': 'Users',
    'clients': 'Clients',
    'products': 'Products',
    'invoices': 'Invoices',
    'expenses': 'Expenses',
    'reports': 'Reports',
    'settings': 'Settings',
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<PermissionsCubit>().loadRolesAndPermissions();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<PermissionsCubit, PermissionsState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: colorScheme.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
          context.read<PermissionsCubit>().clearError();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Column(
          children: [
            // Header Widget - Fixed at top
            _buildPermissionsHeader(),

            // Permissions Content - Takes remaining space
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: Column(
                  children: [
                    // Tab Bar
                    Container(
                      color: AppColors.backgroundLight,
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: AppColors.primary,
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.grey,
                        tabs: const [
                          Tab(text: 'Roles'),
                          Tab(text: 'Permissions'),
                        ],
                      ),
                    ),
                    // Tab Content
                    Expanded(
                      child: BlocBuilder<PermissionsCubit, PermissionsState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            );
                          }
                          return TabBarView(
                            controller: _tabController,
                            children: [
                              _buildRolesTab(state),
                              _buildPermissionsTab(state),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddRoleDialog(context),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.add, size: 26.sp, color: AppColors.white),
        ),
      ),
    );
  }

  // Helper Methods
  Widget _buildPermissionsHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Menu Button
                GestureDetector(
                  onTap: _handleMenuPressed,
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.menu_rounded,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manage Permissions',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Manage roles and permissions',
                        style: TextStyle(
                          color: AppColors.white.withOpacity(0.8),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                // Permissions Button
                GestureDetector(
                  onTap: _navigateToUsers,
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.people_rounded,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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

  void _navigateToUsers() {
    Navigator.pushNamed(context, AppRoutes.usersListRoute);
  }

  Widget _buildRolesTab(PermissionsState state) {
    return Column(
      children: [
        // Module Filter
        Container(
          padding: EdgeInsets.all(16.w),
          child: DropdownButtonFormField<String>(
            initialValue: _selectedModule,
            decoration: InputDecoration(
              labelText: 'Select Module',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: AppColors.backgroundLight,
            ),
            items: _modules.map((module) {
              return DropdownMenuItem(
                value: module,
                child: Text(_moduleNames[module] ?? module),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedModule = value!;
              });
            },
          ),
        ),

        // Roles List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: state.roles.length,
            itemBuilder: (context, index) {
              final role = state.roles[index];
              return _buildRoleCard(role, state);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRoleCard(Role role, PermissionsState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final modulePermissions = role.permissions
        .where((p) => p.module == _selectedModule)
        .toList();

    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: ExpansionTile(
        title: Text(
          role.name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
        ),
        subtitle: Text(
          role.description,
          style: TextStyle(
            color: colorScheme.onSurfaceVariant,
            fontSize: 14.sp,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: Text(
            role.name.substring(0, 1),
            style: TextStyle(color: colorScheme.onPrimary),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: role.isActive ? colorScheme.primary : colorScheme.error,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                role.isActive ? 'Active' : 'Inactive',
                style: TextStyle(color: AppColors.white, fontSize: 12.sp),
              ),
            ),
            SizedBox(width: 8.w),
            PopupMenuButton<String>(
              onSelected: (value) => _handleRoleAction(value, role),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: colorScheme.onSurfaceVariant),
                      SizedBox(width: 8.w),
                      Text(S.of(context).edit),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: colorScheme.error),
                      SizedBox(width: 8.w),
                      Text(
                        S.of(context).delete,
                        style: TextStyle(color: AppColors.error),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_moduleNames[_selectedModule]} Permissions',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 8.h),
                if (modulePermissions.isEmpty)
                  Text(
                    'No permissions for this module',
                    style: TextStyle(color: AppColors.grey, fontSize: 12.sp),
                  )
                else
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: modulePermissions.map((permission) {
                      return Chip(
                        label: Text(
                          permission.name,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                        side: BorderSide(color: AppColors.primary),
                      );
                    }).toList(),
                  ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      'Total Permissions: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      '${role.permissions.length}',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
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

  Widget _buildPermissionsTab(PermissionsState state) {
    final modulePermissions = state.permissions
        .where((p) => p.module == _selectedModule)
        .toList();

    return Column(
      children: [
        // Module Filter
        Container(
          padding: EdgeInsets.all(16.w),
          child: DropdownButtonFormField<String>(
            initialValue: _selectedModule,
            decoration: InputDecoration(
              labelText: 'Select Module',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: AppColors.backgroundLight,
            ),
            items: _modules.map((module) {
              return DropdownMenuItem(
                value: module,
                child: Text(_moduleNames[module] ?? module),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedModule = value!;
              });
            },
          ),
        ),

        // Permissions List
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: modulePermissions.length,
            itemBuilder: (context, index) {
              final permission = modulePermissions[index];
              return _buildPermissionCard(permission);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionCard(Permission permission) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: ListTile(
        leading: Icon(
          _getPermissionIcon(permission.action),
          color: colorScheme.primary,
        ),
        title: Text(
          permission.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        subtitle: Text(
          permission.description,
          style: TextStyle(
            color: colorScheme.onSurfaceVariant,
            fontSize: 12.sp,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: permission.isActive
                ? colorScheme.primary
                : colorScheme.error,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            permission.isActive ? 'Active' : 'Inactive',
            style: TextStyle(color: AppColors.white, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  IconData _getPermissionIcon(String action) {
    switch (action) {
      case 'create':
        return Icons.add;
      case 'read':
        return Icons.visibility;
      case 'update':
        return Icons.edit;
      case 'delete':
        return Icons.delete;
      case 'send':
        return Icons.send;
      case 'export':
        return Icons.download;
      case 'manage_permissions':
        return Icons.security;
      case 'company':
        return Icons.business;
      case 'system':
        return Icons.settings;
      default:
        return Icons.check_circle;
    }
  }

  void _handleRoleAction(String action, Role role) {
    switch (action) {
      case 'edit':
        _showEditRoleDialog(context, role);
        break;
      case 'delete':
        _showDeleteRoleConfirmation(context, role);
        break;
    }
  }

  void _showAddRoleDialog(BuildContext context) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Role'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Role Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Role Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                final newRole = Role(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: nameController.text,
                  description: descriptionController.text,
                );
                context.read<PermissionsCubit>().addRole(newRole);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditRoleDialog(BuildContext context, Role role) {
    final nameController = TextEditingController(text: role.name);
    final descriptionController = TextEditingController(text: role.description);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Role'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Role Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Role Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty) {
                final updatedRole = Role(
                  id: role.id,
                  name: nameController.text,
                  description: descriptionController.text,
                  isActive: role.isActive,
                  permissions: role.permissions,
                );
                context.read<PermissionsCubit>().updateRole(updatedRole);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteRoleConfirmation(BuildContext context, Role role) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Delete'),
        content: Text(
          'Are you sure you want to delete the role "${role.name}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<PermissionsCubit>().deleteRole(role.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: colorScheme.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
