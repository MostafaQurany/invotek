import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/users_and_permissions/data/models/permission_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_state.dart';

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
    'users': 'المستخدمين',
    'clients': 'العملاء',
    'products': 'المنتجات',
    'invoices': 'الفواتير',
    'expenses': 'المصروفات',
    'reports': 'التقارير',
    'settings': 'الإعدادات',
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
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text('إدارة الصلاحيات'),
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          scrolledUnderElevation: 1,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: colorScheme.primary,
            labelColor: colorScheme.onSurface,
            unselectedLabelColor: colorScheme.onSurfaceVariant,
            tabs: const [
              Tab(text: 'الأدوار'),
              Tab(text: 'الصلاحيات'),
            ],
          ),
        ),
        body: BlocBuilder<PermissionsCubit, PermissionsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: CircularProgressIndicator(color: colorScheme.primary),
              );
            }

            return TabBarView(
              controller: _tabController,
              children: [_buildRolesTab(state), _buildPermissionsTab(state)],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddRoleDialog(context),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildRolesTab(PermissionsState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Module Filter
        Container(
          padding: EdgeInsets.all(16.w),
          child: DropdownButtonFormField<String>(
            value: _selectedModule,
            decoration: InputDecoration(
              labelText: 'اختر الوحدة',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
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
                role.isActive ? 'نشط' : 'غير نشط',
                style: TextStyle(color: colorScheme.onPrimary, fontSize: 12.sp),
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
                      Text('تعديل'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: colorScheme.error),
                      SizedBox(width: 8.w),
                      Text('حذف', style: TextStyle(color: colorScheme.error)),
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
                  'صلاحيات ${_moduleNames[_selectedModule]}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: colorScheme.primary,
                  ),
                ),
                SizedBox(height: 8.h),
                if (modulePermissions.isEmpty)
                  Text(
                    'لا توجد صلاحيات لهذه الوحدة',
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 12.sp,
                    ),
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
                        backgroundColor: colorScheme.primary.withOpacity(0.1),
                        side: BorderSide(color: colorScheme.primary),
                      );
                    }).toList(),
                  ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      'إجمالي الصلاحيات: ',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      '${role.permissions.length}',
                      style: TextStyle(
                        color: colorScheme.primary,
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
    final colorScheme = Theme.of(context).colorScheme;
    final modulePermissions = state.permissions
        .where((p) => p.module == _selectedModule)
        .toList();

    return Column(
      children: [
        // Module Filter
        Container(
          padding: EdgeInsets.all(16.w),
          child: DropdownButtonFormField<String>(
            value: _selectedModule,
            decoration: InputDecoration(
              labelText: 'اختر الوحدة',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
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
            permission.isActive ? 'نشط' : 'غير نشط',
            style: TextStyle(color: colorScheme.onPrimary, fontSize: 10.sp),
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
        title: const Text('إضافة دور جديد'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'اسم الدور',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'وصف الدور',
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
            child: const Text('إلغاء'),
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
            child: const Text('إضافة'),
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
        title: const Text('تعديل الدور'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'اسم الدور',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'وصف الدور',
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
            child: const Text('إلغاء'),
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
            child: const Text('حفظ'),
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
        title: const Text('تأكيد الحذف'),
        content: Text('هل أنت متأكد من حذف الدور "${role.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              context.read<PermissionsCubit>().deleteRole(role.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: colorScheme.error),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
