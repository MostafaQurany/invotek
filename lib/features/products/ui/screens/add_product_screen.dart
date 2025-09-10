import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/ui/widgets/tabs/basic_info_tab.dart';
import 'package:invotek/features/products/ui/widgets/tabs/pricing_tab.dart';
import 'package:invotek/features/products/ui/widgets/tabs/inventory_tab.dart';
import 'package:invotek/features/products/ui/widgets/tabs/product_details_tab.dart';
import 'package:invotek/features/products/ui/widgets/dialogs/help_dialog.dart';
import 'package:invotek/generated/l10n.dart';

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

class _AddProductScreenState extends State<AddProductScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final Map<String, String> _validationErrors = {};

  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _costController;
  late TextEditingController _taxRateController;
  late TextEditingController _quantityController;
  late TextEditingController _unitController;
  late TextEditingController _minQuantityController;
  late TextEditingController _maxQuantityController;
  late TextEditingController _skuController;
  late TextEditingController _barcodeController;
  late TextEditingController _brandController;
  late TextEditingController _modelController;
  late TextEditingController _colorController;
  late TextEditingController _materialController;
  late TextEditingController _weightController;
  late TextEditingController _dimensionsController;
  late TextEditingController _notesController;

  String _selectedStatus = 'active';
  String? _selectedCategoryId;
  bool _isActive = true;
  bool _hasTax = false;
  bool _trackInventory = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });

    // Initialize controllers
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController();
    _costController = TextEditingController();
    _taxRateController = TextEditingController();
    _quantityController = TextEditingController();
    _unitController = TextEditingController();
    _minQuantityController = TextEditingController();
    _maxQuantityController = TextEditingController();
    _skuController = TextEditingController();
    _barcodeController = TextEditingController();
    _brandController = TextEditingController();
    _modelController = TextEditingController();
    _colorController = TextEditingController();
    _materialController = TextEditingController();
    _weightController = TextEditingController();
    _dimensionsController = TextEditingController();
    _notesController = TextEditingController();

    // Add listeners to trigger UI updates
    _nameController.addListener(_onFieldChanged);
    _priceController.addListener(_onFieldChanged);
    _quantityController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();

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
    _minQuantityController.dispose();
    _maxQuantityController.dispose();
    _skuController.dispose();
    _barcodeController.dispose();
    _brandController.dispose();
    _modelController.dispose();
    _colorController.dispose();
    _materialController.dispose();
    _weightController.dispose();
    _dimensionsController.dispose();
    _notesController.dispose();
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
              child: IgnorePointer(
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
            ),

            // Form Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics:
                    const NeverScrollableScrollPhysics(), // Disable swipe navigation
                children: [
                  BasicInfoTab(
                    nameController: _nameController,
                    descriptionController: _descriptionController,
                    selectedCategoryId: _selectedCategoryId,
                    selectedStatus: _selectedStatus,
                    onCategoryChanged: (value) {
                      setState(() {
                        _selectedCategoryId = value;
                      });
                    },
                    onStatusChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedStatus = value;
                        });
                      }
                    },
                    validationErrors: _validationErrors,
                  ),
                  PricingTab(
                    priceController: _priceController,
                    costController: _costController,
                    taxRateController: _taxRateController,
                    validationErrors: _validationErrors,
                  ),
                  InventoryTab(
                    quantityController: _quantityController,
                    unitController: _unitController,
                    minQuantityController: _minQuantityController,
                    maxQuantityController: _maxQuantityController,
                    validationErrors: _validationErrors,
                  ),
                  ProductDetailsTab(
                    skuController: _skuController,
                    barcodeController: _barcodeController,
                    brandController: _brandController,
                    modelController: _modelController,
                    colorController: _colorController,
                    materialController: _materialController,
                    weightController: _weightController,
                    dimensionsController: _dimensionsController,
                    notesController: _notesController,
                    isActive: _isActive,
                    hasTax: _hasTax,
                    trackInventory: _trackInventory,
                    onActiveChanged: (value) {
                      setState(() {
                        _isActive = value;
                      });
                    },
                    onTaxChanged: (value) {
                      setState(() {
                        _hasTax = value;
                      });
                    },
                    onInventoryChanged: (value) {
                      setState(() {
                        _trackInventory = value;
                      });
                    },
                  ),
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
                        backgroundColor: _isCurrentTabValid()
                            ? AppColors.primary
                            : AppColors.grey.withOpacity(0.3),
                        foregroundColor: _isCurrentTabValid()
                            ? AppColors.white
                            : AppColors.greyDark,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        _currentTabIndex == 3 ? s.save : 'Next',
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

  void _goToNextTab() {
    if (_currentTabIndex < 3) {
      // Validate current tab before proceeding
      if (_validateCurrentTab()) {
        _tabController.animateTo(_currentTabIndex + 1);
      }
    }
  }

  void _goToPreviousTab() {
    if (_currentTabIndex > 0) {
      _tabController.animateTo(_currentTabIndex - 1);
    }
  }

  void _handleSubmit() {
    print('🔄 Save button pressed');
    print('📝 Name: ${_nameController.text.trim()}');
    print('💰 Price: ${_priceController.text.trim()}');
    print('📦 Quantity: ${_quantityController.text.trim()}');
    print('🏷️ Status: $_selectedStatus');

    // Validate required fields manually since form is only on first tab
    if (_validateForm()) {
      print('✅ Form validation passed');
      final cubit = ProductsCubit.get(context);
      cubit.createProduct(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
        price: _priceController.text.trim(),
        cost: _costController.text.trim().isEmpty
            ? null
            : _costController.text.trim(),
        quantity: int.parse(_quantityController.text),
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
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        brand: _brandController.text.trim().isEmpty
            ? null
            : _brandController.text.trim(),
        model: _modelController.text.trim().isEmpty
            ? null
            : _modelController.text.trim(),
        weight: _weightController.text.trim().isEmpty
            ? null
            : _weightController.text.trim(),
        dimensions: _dimensionsController.text.trim().isEmpty
            ? null
            : _dimensionsController.text.trim(),
        color: _colorController.text.trim().isEmpty
            ? null
            : _colorController.text.trim(),
        material: _materialController.text.trim().isEmpty
            ? null
            : _materialController.text.trim(),
        minQuantity: _minQuantityController.text.trim().isEmpty
            ? null
            : int.parse(_minQuantityController.text),
        maxQuantity: _maxQuantityController.text.trim().isEmpty
            ? null
            : int.parse(_maxQuantityController.text),
        isActive: _isActive,
        hasTax: _hasTax,
        trackInventory: _trackInventory,
        status: _selectedStatus,
        categoryId: _selectedCategoryId != null
            ? int.parse(_selectedCategoryId!)
            : null,
      );
    }
  }

  bool _validateCurrentTab() {
    print('🔍 Validating current tab: $_currentTabIndex');

    // Clear any previous validation errors
    setState(() {
      _validationErrors.clear();
    });

    bool isValid = true;
    String errorMessage = '';

    switch (_currentTabIndex) {
      case 0: // Basic Info Tab
        isValid = _validateBasicInfoTab();
        if (!isValid) {
          errorMessage = 'Please fill all required fields in Basic Information';
        }
        break;
      case 1: // Pricing Tab
        isValid = _validatePricingTab();
        if (!isValid) {
          errorMessage = 'Please fill all required fields in Pricing';
        }
        break;
      case 2: // Inventory Tab
        isValid = _validateInventoryTab();
        if (!isValid) {
          errorMessage = 'Please fill all required fields in Inventory';
        }
        break;
      case 3: // Product Details Tab
        isValid = _validateProductDetailsTab();
        if (!isValid) {
          errorMessage = 'Please fill all required fields in Product Details';
        }
        break;
    }

    if (!isValid) {
      _showValidationError(errorMessage);
    } else {
      print('✅ Current tab validation passed');
    }

    return isValid;
  }

  bool _isCurrentTabValid() {
    switch (_currentTabIndex) {
      case 0: // Basic Info Tab
        return _nameController.text.trim().isNotEmpty &&
            _selectedStatus.isNotEmpty;
      case 1: // Pricing Tab
        return _priceController.text.trim().isNotEmpty &&
            double.tryParse(_priceController.text.trim()) != null;
      case 2: // Inventory Tab
        return _quantityController.text.trim().isNotEmpty &&
            int.tryParse(_quantityController.text.trim()) != null;
      case 3: // Product Details Tab
        return true; // No required fields in this tab
      default:
        return false;
    }
  }

  bool _validateBasicInfoTab() {
    bool isValid = true;

    // Validate required fields for Basic Info
    if (_nameController.text.trim().isEmpty) {
      print('❌ Name is empty');
      _validationErrors['name'] = 'Product name is required';
      isValid = false;
    }

    if (_selectedStatus.isEmpty) {
      print('❌ Status not selected');
      _validationErrors['status'] = 'Product status is required';
      isValid = false;
    }

    return isValid;
  }

  bool _validatePricingTab() {
    bool isValid = true;

    // Validate required fields for Pricing
    if (_priceController.text.trim().isEmpty) {
      print('❌ Price is empty');
      _validationErrors['price'] = 'Selling price is required';
      isValid = false;
    } else if (double.tryParse(_priceController.text.trim()) == null) {
      print('❌ Invalid price format');
      _validationErrors['price'] = 'Please enter a valid price';
      isValid = false;
    }

    return isValid;
  }

  bool _validateInventoryTab() {
    bool isValid = true;

    // Validate required fields for Inventory
    if (_quantityController.text.trim().isEmpty) {
      print('❌ Quantity is empty');
      _validationErrors['quantity'] = 'Quantity is required';
      isValid = false;
    } else if (int.tryParse(_quantityController.text.trim()) == null) {
      print('❌ Invalid quantity format');
      _validationErrors['quantity'] = 'Please enter a valid quantity';
      isValid = false;
    }

    return isValid;
  }

  bool _validateProductDetailsTab() {
    bool isValid = true;

    // No required fields in Product Details tab
    return isValid;
  }

  bool _validateForm() {
    print('🔍 Validating entire form...');

    // Clear any previous validation errors
    setState(() {
      _validationErrors.clear();
    });

    bool isValid = true;

    // Validate all tabs
    if (!_validateBasicInfoTab()) {
      isValid = false;
    }

    if (!_validatePricingTab()) {
      isValid = false;
    }

    if (!_validateInventoryTab()) {
      isValid = false;
    }

    if (!_validateProductDetailsTab()) {
      isValid = false;
    }

    if (!isValid) {
      // Show the first validation error
      final firstError = _validationErrors.values.first;
      _showValidationError(firstError);
    } else {
      print('✅ All validations passed');
    }

    return isValid;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
