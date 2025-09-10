import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/init_dependencies_map.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class EditProductScreen extends StatefulWidget {
  final ProductModel product;

  const EditProductScreen({super.key, required this.product});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class EditProductScreenWithProvider extends StatelessWidget {
  final ProductModel product;

  const EditProductScreenWithProvider({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsCubit>(),
      child: EditProductScreen(product: product),
    );
  }
}

class _EditProductScreenState extends State<EditProductScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.editProduct),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: AppColors.textPrimary),
            onPressed: () => _showHelpDialog(context),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          state.whenOrNull(
            updateSuccess:
                (
                  products,
                  updated,
                  selectedProduct,
                  currentPage,
                  totalPages,
                ) async {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  await messenger
                      .showSnackBar(
                        SnackBar(
                          content: Text(s.productUpdatedSuccessfully),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      )
                      .closed;
                  Navigator.pop(context);
                },
            failure:
                (products, selectedProduct, currentPage, totalPages, error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(s.errorOccurred(error)),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                },
          );
        },
        child: Column(
          children: [
            // Tab Bar
            Container(
              color: AppColors.white,
              child: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.greyDark,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
                tabs: [
                  Tab(text: s.basicInformation),
                  Tab(text: s.pricing),
                  Tab(text: s.inventory),
                  Tab(text: s.productDetails),
                ],
              ),
            ),

            // Form Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable swipe navigation
                children: [
                  _buildBasicInfoTab(s),
                  _buildPricingTab(s),
                  _buildInventoryTab(s),
                  _buildProductDetailsTab(s),
                ],
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
                  // Cancel/Previous Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _currentTabIndex == 0
                          ? () =>
                                Navigator.pop(context) // Cancel on first tab
                          : () => _goToPreviousTab(), // Previous on other tabs
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
                        _currentTabIndex == 0 ? s.cancel : 'Previous',
                        style: TextStyle(
                          color: AppColors.greyDark,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // Next/Save Button
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: _currentTabIndex == 3
                          ? _handleSubmit // Save on last tab
                          : () => _goToNextTab(), // Next on other tabs
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentTabIndex == 3 ? s.editProduct : 'Next',
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
    );
  }

  Widget _buildBasicInfoTab(S s) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.basicInformation,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          _buildFormField(
            label: '${s.name} *',
            hint: s.name,
            icon: Icons.inventory_2_outlined,
            initialValue: widget.product.name,
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.description,
            hint: s.description,
            icon: Icons.description_outlined,
            initialValue: widget.product.description,
            maxLines: 3,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: 'Category',
            hint: 'Product Category',
            icon: Icons.category_outlined,
            initialValue: widget.product.productCategoryId?.toString(),
          ),
          SizedBox(height: 16.h),
          _buildStatusDropdown(s),
        ],
      ),
    );
  }

  Widget _buildPricingTab(S s) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.pricing,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          _buildFormField(
            label: '${s.sellingPrice} *',
            hint: s.sellingPrice,
            icon: Icons.sell_outlined,
            initialValue: widget.product.price,
            keyboardType: TextInputType.number,
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.costPrice,
            hint: s.costPrice,
            icon: Icons.account_balance_wallet_outlined,
            initialValue: widget.product.cost,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.taxRate,
            hint: s.taxRate,
            icon: Icons.percent_outlined,
            initialValue: widget.product.taxRate,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _buildInventoryTab(S s) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.inventory,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          _buildFormField(
            label: '${s.quantity} *',
            hint: s.quantity,
            icon: Icons.numbers_outlined,
            initialValue: widget.product.quantity?.toString(),
            keyboardType: TextInputType.number,
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.unit,
            hint: 'piece, kg, meter...',
            icon: Icons.straighten_outlined,
            initialValue: widget.product.unit,
          ),
          SizedBox(height: 16.h),
          // Additional inventory fields can be added here if needed
        ],
      ),
    );
  }

  Widget _buildProductDetailsTab(S s) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.productDetails,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  label: s.productSku,
                  hint: s.productSku,
                  icon: Icons.qr_code_outlined,
                  initialValue: widget.product.sku,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildFormField(
                  label: s.barcode,
                  hint: s.barcode,
                  icon: Icons.barcode_reader,
                  initialValue: widget.product.barcode,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Additional product detail fields can be added here if needed
          SizedBox(height: 20.h),
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          SwitchListTile(
            title: Text(s.productIsActive),
            subtitle: Text(s.enableDisableProduct),
            value: widget.product.isActive ?? true,
            onChanged: (value) {
              // Handle active change
            },
            activeColor: AppColors.primary,
          ),
          Divider(height: 1),
          SwitchListTile(
            title: Text(s.productIsTaxable),
            subtitle: Text(s.applyTaxToProduct),
            value: widget.product.hasTax ?? false,
            onChanged: (value) {
              // Handle tax change
            },
            activeColor: AppColors.primary,
          ),
          Divider(height: 1),
          SwitchListTile(
            title: Text(s.trackInventory),
            subtitle: Text(s.trackAvailableProductQuantity),
            value: widget.product.trackInventory ?? false,
            onChanged: (value) {
              // Handle inventory tracking change
            },
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required String hint,
    required IconData icon,
    String? initialValue,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool isRequired = false,
  }) {
    final controller = TextEditingController(text: initialValue ?? '');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            if (isRequired) ...[
              SizedBox(width: 4.w),
              Text(
                '*',
                style: TextStyle(
                  color: AppColors.error,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.greyDark.withOpacity(0.6),
              fontSize: 14.sp,
            ),
            prefixIcon: Icon(icon, color: AppColors.primary, size: 20.sp),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
          ),
          textDirection:
              keyboardType == TextInputType.emailAddress ||
                  keyboardType == TextInputType.phone ||
                  keyboardType == TextInputType.number
              ? TextDirection.ltr
              : TextDirection.rtl,
        ),
      ],
    );
  }

  Widget _buildStatusDropdown(S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${s.status} *',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '*',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: widget.product.status ?? 'active',
          isExpanded: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.flag_outlined,
              color: AppColors.primary,
              size: 20.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
          ),
          items: [
            DropdownMenuItem(
              value: 'active',
              child: Text(s.active, overflow: TextOverflow.ellipsis),
            ),
            DropdownMenuItem(
              value: 'inactive',
              child: Text(s.inactive, overflow: TextOverflow.ellipsis),
            ),
            DropdownMenuItem(
              value: 'out_of_stock',
              child: Text('Out of Stock', overflow: TextOverflow.ellipsis),
            ),
            DropdownMenuItem(
              value: 'discontinued',
              child: Text('Discontinued', overflow: TextOverflow.ellipsis),
            ),
          ],
          onChanged: (value) {
            // Handle status change
          },
        ),
      ],
    );
  }

  void _showHelpDialog(BuildContext context) {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Product Help'),
        content: Text(
          'This screen helps you edit product information. Navigate through tabs to update different sections.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.close),
          ),
        ],
      ),
    );
  }

  void _goToNextTab() {
    if (_currentTabIndex < 3) {
      _tabController.animateTo(_currentTabIndex + 1);
    }
  }

  void _goToPreviousTab() {
    if (_currentTabIndex > 0) {
      _tabController.animateTo(_currentTabIndex - 1);
    }
  }

  void _handleSubmit() {
    final cubit = ProductsCubit.get(context);
    cubit.updateProduct(
      id: widget.product.id ?? 0,
      name: widget.product.name ?? '',
      description: widget.product.description,
      price: widget.product.price ?? '',
      cost: widget.product.cost,
      quantity: widget.product.quantity ?? 0,
      sku: widget.product.sku,
      barcode: widget.product.barcode,
      unit: widget.product.unit,
      taxRate: widget.product.taxRate,
      isActive: widget.product.isActive ?? true,
      hasTax: widget.product.hasTax ?? false,
      trackInventory: widget.product.trackInventory ?? false,
      status: widget.product.status ?? 'active',
      categoryId: widget.product.productCategoryId,
    );
  }
}
