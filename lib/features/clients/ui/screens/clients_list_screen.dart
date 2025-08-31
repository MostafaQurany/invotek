import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
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
    // تحميل العملاء عند فتح الشاشة
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
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة العملاء'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
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
                backgroundColor: Colors.red,
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
                    return const Center(child: CircularProgressIndicator());
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
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
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
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.grey[50],
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people_outline, size: 80.sp, color: Colors.grey[400]),
          SizedBox(height: 16.h),
          Text(
            'لا توجد عملاء',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'اضغط على زر الإضافة لإنشاء عميل جديد',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
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
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: CircleAvatar(
          backgroundColor: AppColors.primary,
          child: Text(
            client.name.substring(0, 1).toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(
          client.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            Text(
              client.email,
              style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
            ),
            if (client.phone != null) ...[
              SizedBox(height: 2.h),
              Text(
                client.phone!,
                style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
              ),
            ],
            if (client.company != null) ...[
              SizedBox(height: 2.h),
              Text(
                client.company!,
                style: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
              ),
            ],
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: client.status == 'active' ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                client.status == 'active' ? 'نشط' : 'غير نشط',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) => _handleClientAction(value, client),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'view',
              child: Row(
                children: [
                  Icon(Icons.visibility),
                  SizedBox(width: 8),
                  Text('عرض'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [Icon(Icons.edit), SizedBox(width: 8), Text('تعديل')],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('حذف', style: TextStyle(color: Colors.red)),
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text('هل أنت متأكد من حذف العميل "${client.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              context.read<ClientsCubit>().deleteClient(client.id);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
