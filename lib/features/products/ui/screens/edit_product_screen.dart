import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/forms/category_dropdown.dart';
import 'package:invotek/features/products/ui/widgets/forms/status_dropdown.dart';
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
    return EditProductScreen(product: product);
  }
}

class _EditProductScreenState extends State<EditProductScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  // Form Controllers
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _costController;
  late TextEditingController _taxRateController;
  late TextEditingController _quantityController;
  late TextEditingController _unitController;
  late TextEditingController _skuController;
  late TextEditingController _barcodeController;

  // Form State
  String? _selectedCategoryId;
  String _selectedStatus = 'active';
  bool _isActive = true;
  bool _hasTax = false;
  bool _trackInventory = false;

  // Form Key for validation
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });

    // Initialize controllers with product data
    _nameController = TextEditingController(text: widget.product.name ?? '');
    _descriptionController = TextEditingController(
      text: widget.product.description ?? '',
    );
    _priceController = TextEditingController(text: widget.product.price ?? '');
    _costController = TextEditingController(text: widget.product.cost ?? '');
    _taxRateController = TextEditingController(
      text: widget.product.taxRate ?? '',
    );
    _quantityController = TextEditingController(
      text: widget.product.quantity?.toString() ?? '',
    );
    _unitController = TextEditingController(text: widget.product.unit ?? '');
    _skuController = TextEditingController(text: widget.product.sku ?? '');
    _barcodeController = TextEditingController(
      text: widget.product.barcode ?? '',
    );

    // Initialize form state
    _selectedCategoryId = widget.product.productCategoryId?.toString();
    _selectedStatus = widget.product.status ?? 'active';
    _isActive = widget.product.isActive ?? true;
    _hasTax = widget.product.hasTax ?? false;
    _trackInventory = widget.product.trackInventory ?? false;
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _costController.dispose();
    _taxRateController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    _skuController.dispose();
    _barcodeController.dispose();
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
              child: Form(
                key: _formKey,
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
            controller: _nameController,
            label: '${s.name} *',
            hint: s.name,
            icon: Icons.inventory_2_outlined,
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            controller: _descriptionController,
            label: s.description,
            hint: s.description,
            icon: Icons.description_outlined,
            maxLines: 3,
          ),
          SizedBox(height: 16.h),
          CategoryDropdown(
            selectedCategoryId: _selectedCategoryId,
            onChanged: (value) {
              setState(() {
                _selectedCategoryId = value;
              });
            },
          ),
          SizedBox(height: 16.h),
          StatusDropdown(
            selectedStatus: _selectedStatus,
            onChanged: (value) {
              setState(() {
                _selectedStatus = value ?? 'active';
              });
            },
          ),
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
            controller: _priceController,
            label: '${s.sellingPrice} *',
            hint: s.sellingPrice,
            icon: Icons.sell_outlined,
            keyboardType: TextInputType.number,
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            controller: _costController,
            label: s.costPrice,
            hint: s.costPrice,
            icon: Icons.account_balance_wallet_outlined,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            controller: _taxRateController,
            label: s.taxRate,
            hint: s.taxRate,
            icon: Icons.percent_outlined,
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
            controller: _quantityController,
            label: '${s.quantity} *',
            hint: s.quantity,
            icon: Icons.numbers_outlined,
            keyboardType: TextInputType.number,
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            controller: _unitController,
            label: s.unit,
            hint: 'piece, kg, meter...',
            icon: Icons.straighten_outlined,
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
                  controller: _skuController,
                  label: s.productSku,
                  hint: s.productSku,
                  icon: Icons.qr_code_outlined,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildFormField(
                  controller: _barcodeController,
                  label: s.barcode,
                  hint: s.barcode,
                  icon: Icons.barcode_reader,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Additional product detail fields can be added here if needed
          SizedBox(height: 20.h),
          Text(
            s.settings,
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
            value: _isActive,
            onChanged: (value) {
              setState(() {
                _isActive = value;
              });
            },
            activeColor: AppColors.primary,
          ),
          Divider(height: 1),
          SwitchListTile(
            title: Text(s.productIsTaxable),
            subtitle: Text(s.applyTaxToProduct),
            value: _hasTax,
            onChanged: (value) {
              setState(() {
                _hasTax = value;
              });
            },
            activeColor: AppColors.primary,
          ),
          Divider(height: 1),
          SwitchListTile(
            title: Text(s.trackInventory),
            subtitle: Text(s.trackAvailableProductQuantity),
            value: _trackInventory,
            onChanged: (value) {
              setState(() {
                _trackInventory = value;
              });
            },
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool isRequired = false,
  }) {
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
    // Validate form if it exists
    final formState = _formKey.currentState;
    if (formState != null && !formState.validate()) {
      // Show error message or scroll to first error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
      return;
    }

    // Validate required fields
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product name is required'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
      return;
    }

    if (_priceController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product price is required'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
      return;
    }

    if (_quantityController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Product quantity is required'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
      return;
    }

    // Parse quantity
    int? quantity;
    try {
      quantity = int.parse(_quantityController.text.trim());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid quantity'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
      return;
    }

    // Parse category ID
    int? categoryId;
    if (_selectedCategoryId != null && _selectedCategoryId!.isNotEmpty) {
      try {
        categoryId = int.parse(_selectedCategoryId!);
      } catch (e) {
        // Category ID parsing failed, but it's optional
        categoryId = null;
      }
    }

    final cubit = ProductsCubit.get(context);
    cubit.updateProduct(
      id: widget.product.id ?? 0,
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      price: _priceController.text.trim(),
      cost: _costController.text.trim().isEmpty
          ? null
          : _costController.text.trim(),
      quantity: quantity,
      sku: _skuController.text.trim().isEmpty
          ? null
          : _skuController.text.trim(),
      barcode: _barcodeController.text.trim().isEmpty
          ? null
          : _barcodeController.text.trim(),
      unit: _unitController.text.trim().isEmpty
          ? null
          : _unitController.text.trim(),
      taxRate: _taxRateController.text.trim().isEmpty
          ? null
          : _taxRateController.text.trim(),
      isActive: _isActive,
      hasTax: _hasTax,
      trackInventory: _trackInventory,
      status: _selectedStatus,
      categoryId: categoryId,
    );
  }
}
