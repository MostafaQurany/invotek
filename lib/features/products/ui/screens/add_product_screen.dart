import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/ui/widgets/dialogs/help_dialog.dart';
import 'package:invotek/features/products/ui/widgets/forms/category_dropdown.dart';
import 'package:invotek/features/products/ui/widgets/forms/custom_text_field.dart';
import 'package:invotek/features/products/ui/widgets/forms/form_section_card.dart';
import 'package:invotek/features/products/ui/widgets/forms/status_dropdown.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/products/constants/products_permissions.dart';
import 'package:uuid/uuid.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class AddProductScreenWithProvider extends StatelessWidget {
  const AddProductScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddProductScreen();
  }
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _validationErrors = {};

  // Form controllers - only required fields
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _costController;
  late TextEditingController _taxRateController;
  late TextEditingController _quantityController;
  late TextEditingController _unitController;
  late TextEditingController _skuController;
  late TextEditingController _barcodeController;
  late TextEditingController _imageController;

  String _selectedStatus = 'active';
  String? _selectedCategoryId;
  bool _isActive = true;
  bool _hasTax = false;
  bool _trackInventory = false;

  @override
  void initState() {
    super.initState();

    // Initialize controllers
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _costController = TextEditingController();
    _taxRateController = TextEditingController();
    _quantityController = TextEditingController();
    _unitController = TextEditingController();
    _skuController = TextEditingController();
    _barcodeController = TextEditingController();
    _imageController = TextEditingController();

    // Add listeners to trigger UI updates
    _nameController.addListener(_onFieldChanged);
    _priceController.addListener(_onFieldChanged);
    _quantityController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    // Remove listeners before disposing
    _nameController.removeListener(_onFieldChanged);
    _priceController.removeListener(_onFieldChanged);
    _quantityController.removeListener(_onFieldChanged);

    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _costController.dispose();
    _taxRateController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    _skuController.dispose();
    _barcodeController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      // Trigger UI rebuild to update button state
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    // Check permission for creating products
    if (!PermissionChecker.hasPermission(context, ProductsPermissions.create)) {
      return Scaffold(
        appBar: AppBar(
          title: Text(s.addProduct),
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 64.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              Text(
                s.productsNoPermissionToView,
                style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                s.productsNoPermissionToAct,
                style: TextStyle(fontSize: 14.sp, color: AppColors.greyDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.addProduct),
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
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const HelpDialog(),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocListener<ProductsCubit, ProductsState>(
        listener: (context, state) {
          state.whenOrNull(
            createSuccess:
                (
                  products,
                  created,
                  selectedProduct,
                  currentPage,
                  totalPages,
                ) async {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  await messenger
                      .showSnackBar(
                        SnackBar(
                          content: Text(s.productAddedSuccessfully),
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
                      content: Text(
                        S.of(context).errorOccurredWithMessage(error.message),
                      ),
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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Form Content - Scrollable
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Basic Information Section
                      FormSectionCard(
                        title: s.basicInformation,
                        icon: Icons.inventory_2_outlined,
                        children: [
                          // Product Name
                          CustomTextField(
                            controller: _nameController,
                            label: s.name,
                            hint: s.productsEnterProductName,
                            icon: Icons.inventory_2,
                            isRequired: true,
                            errorText: _validationErrors['name'],
                          ),
                          SizedBox(height: 16.h),

                          // Description
                          CustomTextField(
                            controller: _descriptionController,
                            label: s.description,
                            hint: s.productsEnterProductDescription,
                            icon: Icons.description_outlined,
                            maxLines: 3,
                          ),
                          SizedBox(height: 16.h),

                          // Category and Status Row
                          CategoryDropdown(
                            selectedCategoryId: _selectedCategoryId,
                            onChanged: (value) {
                              setState(() {
                                _selectedCategoryId = value;
                              });
                            },
                            errorText: _validationErrors['category'],
                          ),
                          SizedBox(width: 16.h),
                          StatusDropdown(
                            selectedStatus: _selectedStatus,
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedStatus = value;
                                  if (value == 'active') {
                                    _isActive = true;
                                  } else {
                                    _isActive = false;
                                  }
                                });
                              }
                            },
                            errorText: _validationErrors['status'],
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Pricing Section
                      FormSectionCard(
                        title: s.pricing,
                        icon: Icons.attach_money_outlined,
                        children: [
                          // Selling Price and Cost Price Row
                          CustomTextField(
                            controller: _priceController,
                            label: s.sellingPrice,
                            hint: s.productsEnterSellingPrice,
                            icon: Icons.sell_outlined,
                            keyboardType: TextInputType.number,
                            isRequired: true,
                            errorText: _validationErrors['price'],
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            controller: _costController,
                            label: s.costPrice,
                            hint: s.productsEnterCostPrice,
                            icon: Icons.account_balance_wallet_outlined,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 16.h),
                          SwitchListTile(
                            title: Text(s.productsProductIsTaxable),
                            subtitle: Text(s.productsApplyTaxToProduct),
                            value: _hasTax,
                            onChanged: (value) {
                              setState(() {
                                _hasTax = value;
                              });
                            },
                            activeThumbColor: AppColors.primary,
                          ),
                          SizedBox(height: 16.h),

                          // Tax Rate
                          if (_hasTax)
                            CustomTextField(
                              controller: _taxRateController,
                              label: s.taxRate,
                              hint: s.productsEnterTaxRatePercentage,
                              icon: Icons.percent_outlined,
                              keyboardType: TextInputType.number,
                            ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Inventory Section
                      FormSectionCard(
                        title: s.inventory,
                        icon: Icons.inventory_outlined,
                        children: [
                          // Quantity and Unit Row
                          CustomTextField(
                            controller: _quantityController,
                            label: s.quantity,
                            hint: s.productsEnterQuantity,
                            icon: Icons.numbers_outlined,
                            keyboardType: TextInputType.number,
                            isRequired: true,
                            errorText: _validationErrors['quantity'],
                          ),
                          SizedBox(height: 16.h),
                          CustomTextField(
                            controller: _unitController,
                            label: s.unit,
                            hint: s.productsEnterUnit,
                            icon: Icons.straighten_outlined,
                          ),
                          SizedBox(height: 16.h),

                          // SKU and Barcode Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: _skuController,
                                  label: s.sku,
                                  hint: s.productsEnterSKU,
                                  icon: Icons.qr_code_outlined,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              // generate SKU button
                              IconButton(
                                onPressed: () {
                                  // generate uuid
                                  final uuid = Uuid().v4();
                                  _skuController.text = uuid;
                                },
                                icon: Icon(Icons.qr_code_scanner, size: 45.sp),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  controller: _barcodeController,
                                  label: s.barcode,
                                  hint: s.productsEnterBarcode,
                                  icon: Icons.qr_code_2_outlined,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              // generate barcode button
                              IconButton(
                                onPressed: () {
                                  // generate uuid
                                  final uuid = Uuid().v4();
                                  _barcodeController.text = uuid;
                                },
                                icon: Icon(Icons.qr_code_scanner, size: 45.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),

                      // Settings Section
                      FormSectionCard(
                        title: s.productsSettings,
                        icon: Icons.settings_outlined,
                        children: [
                          Divider(height: 1),

                          // Track Inventory Switch
                          SwitchListTile(
                            title: Text(s.trackInventory),
                            subtitle: Text(
                              s.productsTrackAvailableProductQuantity,
                            ),
                            value: _trackInventory,
                            onChanged: (value) {
                              setState(() {
                                _trackInventory = value;
                              });
                            },
                            activeThumbColor: AppColors.primary,
                          ),
                        ],
                      ),
                      SizedBox(height: 80.h), // Extra space for bottom button
                    ],
                  ),
                ),
              ),

              // Bottom Action Button
              Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 16.w,
                  bottom: 16.w + MediaQuery.of(context).padding.bottom,
                ),
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
                child: FilledButton(
                  onPressed: _isFormValid() ? _handleSubmit : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: _isFormValid()
                        ? AppColors.primary
                        : AppColors.grey.withOpacity(0.3),
                    foregroundColor: _isFormValid()
                        ? AppColors.white
                        : AppColors.greyDark,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      s.save,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isFormValid() {
    return _nameController.text.trim().isNotEmpty &&
        _selectedStatus.isNotEmpty &&
        _priceController.text.trim().isNotEmpty &&
        double.tryParse(_priceController.text.trim()) != null &&
        _quantityController.text.trim().isNotEmpty &&
        int.tryParse(_quantityController.text.trim()) != null;
  }

  void _handleSubmit() {
    if (!_validateForm()) {
      return;
    }

    final cubit = ProductsCubit.get(context);
    cubit.createProduct(
      name: _nameController.text.trim(),
      productCategoryId: _selectedCategoryId != null
          ? int.parse(_selectedCategoryId!)
          : null,
      sku: _skuController.text.trim().isEmpty
          ? null
          : _skuController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      image: _imageController.text.trim().isEmpty
          ? null
          : _imageController.text.trim(),
      price: _priceController.text.trim().isEmpty
          ? null
          : double.tryParse(_priceController.text.trim()),
      cost: _costController.text.trim().isEmpty
          ? null
          : double.tryParse(_costController.text.trim()),
      taxRate: _taxRateController.text.trim().isEmpty
          ? null
          : double.tryParse(_taxRateController.text.trim()),
      quantity: _quantityController.text.trim().isEmpty
          ? null
          : int.tryParse(_quantityController.text.trim()),
      barcode: _barcodeController.text.trim().isEmpty
          ? null
          : _barcodeController.text.trim(),
      unit: _unitController.text.trim().isEmpty
          ? null
          : _unitController.text.trim(),
      hasTax: _hasTax,
      isActive: _isActive,
      trackInventory: _trackInventory,
      status: _selectedStatus,
    );
  }

  bool _validateForm() {
    final s = S.of(context);
    setState(() {
      _validationErrors.clear();
    });

    bool isValid = true;

    // Validate name
    if (_nameController.text.trim().isEmpty) {
      _validationErrors['name'] = s.productsProductNameRequired;
      isValid = false;
    }

    // Validate status
    if (_selectedStatus.isEmpty) {
      _validationErrors['status'] = s.productsProductStatusRequired;
      isValid = false;
    }

    // Validate price
    if (_priceController.text.trim().isEmpty) {
      _validationErrors['price'] = s.productsSellingPriceRequired;
      isValid = false;
    } else if (double.tryParse(_priceController.text.trim()) == null) {
      _validationErrors['price'] = s.productsPleaseEnterValidPrice;
      isValid = false;
    }

    // Validate quantity
    if (_quantityController.text.trim().isEmpty) {
      _validationErrors['quantity'] = s.productsQuantityRequired;
      isValid = false;
    } else if (int.tryParse(_quantityController.text.trim()) == null) {
      _validationErrors['quantity'] = s.productsPleaseEnterValidQuantity;
      isValid = false;
    }

    if (!isValid) {
      final firstError = _validationErrors.values.first;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(firstError),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }

    return isValid;
  }
}
