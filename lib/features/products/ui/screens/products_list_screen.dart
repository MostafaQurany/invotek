import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/home/demo/cubit/menu_cubit.dart';

class ProductsListScreenWithProvider extends StatelessWidget {
  const ProductsListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductsCubit>(
      create: (context) => getIt<ProductsCubit>(),
      child: const ProductsListScreen(),
    );
  }
}

class ProductsListScreen extends StatefulWidget {
  const ProductsListScreen({super.key});

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'all';
  String _selectedStatus = 'all';
  final String _selectedBrand = 'all';

  @override
  void initState() {
    super.initState();
    // Load products if the list is empty
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<ProductsCubit>();
      if (cubit.state.products.isEmpty) {
        cubit.loadProducts();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    final cubit = context.read<ProductsCubit>();
    if (query.isEmpty &&
        _selectedCategory == 'all' &&
        _selectedStatus == 'all' &&
        _selectedBrand == 'all') {
      cubit.loadProducts();
    } else {
      cubit.loadProducts(
        search: query.isEmpty ? null : query,
        category: _selectedCategory == 'all' ? null : _selectedCategory,
        status: _selectedStatus == 'all' ? null : _selectedStatus,
        brand: _selectedBrand == 'all' ? null : _selectedBrand,
      );
    }
  }

  void _showProductOptions(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.visibility, color: AppColors.primary),
              title: const Text('عرض التفاصيل'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/products/details',
                  arguments: product,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.edit, color: AppColors.secondary),
              title: const Text('تعديل المنتج'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/products/edit',
                  arguments: product,
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: AppColors.error),
              title: const Text('حذف المنتج'),
              onTap: () {
                Navigator.pop(context);
                _confirmDeleteProduct(context, product);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDeleteProduct(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تأكيد الحذف'),
        content: Text('هل أنت متأكد من حذف المنتج "${product.name}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ProductsCubit>().deleteProduct(product.id);
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المنتجات'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error!),
                backgroundColor: AppColors.error,
              ),
            );
            context.read<ProductsCubit>().clearError();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // Search and filters
              Container(
                padding: EdgeInsets.all(16.w),
                color: Colors.grey[100],
                child: Column(
                  children: [
                    // Search bar
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'البحث في المنتجات...',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: _onSearch,
                    ),
                    SizedBox(height: 12.h),
                    // Filters
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedCategory,
                            decoration: InputDecoration(
                              labelText: 'الفئة',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            items: [
                              const DropdownMenuItem(
                                value: 'all',
                                child: Text('جميع الفئات'),
                              ),
                              const DropdownMenuItem(
                                value: 'electronics',
                                child: Text('إلكترونيات'),
                              ),
                              const DropdownMenuItem(
                                value: 'clothing',
                                child: Text('ملابس'),
                              ),
                              const DropdownMenuItem(
                                value: 'food',
                                child: Text('طعام'),
                              ),
                              const DropdownMenuItem(
                                value: 'books',
                                child: Text('كتب'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedCategory = value!;
                              });
                              _onSearch(_searchController.text);
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _selectedStatus,
                            decoration: InputDecoration(
                              labelText: 'الحالة',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            items: [
                              const DropdownMenuItem(
                                value: 'all',
                                child: Text('جميع الحالات'),
                              ),
                              const DropdownMenuItem(
                                value: 'active',
                                child: Text('نشط'),
                              ),
                              const DropdownMenuItem(
                                value: 'inactive',
                                child: Text('غير نشط'),
                              ),
                              const DropdownMenuItem(
                                value: 'out_of_stock',
                                child: Text('نفدت الكمية'),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                _selectedStatus = value!;
                              });
                              _onSearch(_searchController.text);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Products list
              Expanded(
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.products.isEmpty
                    ? const Center(
                        child: Text(
                          'لا توجد منتجات',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          context.read<ProductsCubit>().loadProducts();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.all(16.w),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return _buildProductCard(product);
                          },
                        ),
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MenuCubit>().selectMenuItemByRoute('/products/add');
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        onTap: () => _showProductOptions(context, product),
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.inventory_2,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          product.category,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${product.price.toStringAsFixed(2)} ر.س',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(
                            product.status,
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          _getStatusText(product.status),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: _getStatusColor(product.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Icon(Icons.inventory, size: 16.sp, color: Colors.grey[600]),
                  SizedBox(width: 4.w),
                  Text(
                    'الكمية: ${product.quantity}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(width: 16.w),
                  if (product.sku != null) ...[
                    Icon(Icons.qr_code, size: 16.sp, color: Colors.grey[600]),
                    SizedBox(width: 4.w),
                    Text(
                      'SKU: ${product.sku}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ],
              ),
              if (product.description != null) ...[
                SizedBox(height: 8.h),
                Text(
                  product.description!,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.orange;
      case 'out_of_stock':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'نشط';
      case 'inactive':
        return 'غير نشط';
      case 'out_of_stock':
        return 'نفدت الكمية';
      default:
        return status;
    }
  }
}
