import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/clients/demo/cubit/clients_cubit.dart';
import 'package:invotek/features/clients/demo/entit/client_model.dart';
import 'package:invotek/features/home/demo/cubit/menu_cubit.dart';
import 'package:invotek/features/clients/ui/screens/edit_client_screen.dart';
import 'package:invotek/features/clients/ui/screens/client_details_screen.dart';

import 'package:invotek/core/di/injection.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({super.key});

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class ClientsListScreenWithProvider extends StatelessWidget {
  const ClientsListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClientsCubit>(),
      child: const ClientsListScreen(),
    );
  }
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  final _searchController = TextEditingController();
  String _selectedStatus = 'الكل';
  String _selectedCompany = 'الكل';

  @override
  void initState() {
    super.initState();
    // Load clients when screen opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<ClientsCubit>().state.clients.isEmpty) {
        context.read<ClientsCubit>().loadClients();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('قائمة العملاء'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: colorScheme.onSurface),
            onPressed: () {
              context.read<MenuCubit>().selectMenuItemByRoute('/clients/add');
            },
          ),
        ],
      ),
      body: BlocListener<ClientsCubit, ClientsState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: colorScheme.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
            context.read<ClientsCubit>().clearError();
          }
        },
        child: Column(
          children: [
            // Search and Filter Section
            _buildSearchAndFilterSection(),

            // Clients List
            Expanded(
              child: BlocBuilder<ClientsCubit, ClientsState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
                      ),
                    );
                  }

                  if (state.clients.isEmpty) {
                    return _buildEmptyState();
                  }

                  return _buildClientsList(state.clients);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchAndFilterSection() {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: colorScheme.outline.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          // Search Bar
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'البحث في العملاء...',
              prefixIcon: Icon(
                Icons.search,
                color: colorScheme.onSurfaceVariant,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              filled: true,
              fillColor: colorScheme.surfaceContainer,
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                context.read<ClientsCubit>().loadClients(search: value);
              } else {
                context.read<ClientsCubit>().loadClients();
              }
            },
          ),
          SizedBox(height: 16.h),

          // Filters Row
          Row(
            children: [
              // Status Filter
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  decoration: InputDecoration(
                    labelText: 'الحالة',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainer,
                  ),
                  items: ['الكل', 'نشط', 'غير نشط'].map((status) {
                    return DropdownMenuItem(value: status, child: Text(status));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value!;
                    });
                    if (value != null && value != 'الكل') {
                      context.read<ClientsCubit>().loadClients(status: value);
                    } else {
                      context.read<ClientsCubit>().loadClients();
                    }
                  },
                ),
              ),
              SizedBox(width: 12.w),

              // Company Filter
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedCompany,
                  decoration: InputDecoration(
                    labelText: 'الشركة',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    filled: true,
                    fillColor: colorScheme.surfaceContainer,
                  ),
                  items:
                      [
                        'الكل',
                        'شركة التقنية المتقدمة',
                        'مؤسسة الخدمات المالية',
                        'شركة البناء والتطوير',
                        'مؤسسة التعليم الحديث',
                        'شركة السياحة والترفيه',
                        'مؤسسة الرعاية الصحية',
                        'شركة النقل واللوجستيات',
                        'مؤسسة التجارة الإلكترونية',
                      ].map((company) {
                        return DropdownMenuItem(
                          value: company,
                          child: Text(company),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCompany = value!;
                    });
                    if (value != null && value != 'الكل') {
                      context.read<ClientsCubit>().loadClients(company: value);
                    } else {
                      context.read<ClientsCubit>().loadClients();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 80.sp,
            color: colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 16.h),
          Text(
            'لا توجد عملاء',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'اضغط على زر الإضافة لإنشاء عميل جديد',
            style: TextStyle(
              fontSize: 14.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClientsList(List<Client> clients) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: clients.length,
      itemBuilder: (context, index) {
        final client = clients[index];
        return _buildClientCard(client);
      },
    );
  }

  Widget _buildClientCard(Client client) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.1), width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primary,
          child: Text(
            client.name.substring(0, 1).toUpperCase(),
            style: TextStyle(
              color: colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          client.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Text(
              client.email,
              style: TextStyle(
                color: colorScheme.onSurfaceVariant,
                fontSize: 14.sp,
              ),
            ),
            if (client.phone != null) ...[
              SizedBox(height: 2.h),
              Text(
                client.phone!,
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 14.sp,
                ),
              ),
            ],
            if (client.company != null) ...[
              SizedBox(height: 2.h),
              Text(
                client.company!,
                style: TextStyle(
                  color: colorScheme.onSurfaceVariant,
                  fontSize: 14.sp,
                ),
              ),
            ],
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: client.status == 'active'
                    ? colorScheme.primary
                    : colorScheme.error,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                client.status == 'active' ? 'نشط' : 'غير نشط',
                style: TextStyle(
                  color: colorScheme.onPrimary,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleClientAction(value, client),
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'view',
              child: Row(
                children: [
                  Icon(Icons.visibility, color: colorScheme.onSurfaceVariant),
                  SizedBox(width: 8.w),
                  Text('عرض'),
                ],
              ),
            ),
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
      ),
    );
  }

  void _handleClientAction(String action, Client client) {
    switch (action) {
      case 'view':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClientDetailsScreen(client: client),
          ),
        );
        break;
      case 'edit':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditClientScreenWithProvider(client: client),
          ),
        );
        break;
      case 'delete':
        _showDeleteConfirmation(client);
        break;
    }
  }

  void _showDeleteConfirmation(Client client) {
    final colorScheme = Theme.of(context).colorScheme;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('تأكيد الحذف'),
        content: Text('هل أنت متأكد من حذف العميل "${client.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              context.read<ClientsCubit>().deleteClient(client.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: colorScheme.error),
            child: Text('حذف'),
          ),
        ],
      ),
    );
  }
}
