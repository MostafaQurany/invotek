import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/ui/widgets/tabs/additional_info_tab.dart';
import 'package:invotek/features/customers/ui/widgets/tabs/address_info_tab.dart';
import 'package:invotek/features/customers/ui/widgets/tabs/basic_info_tab.dart';
import 'package:invotek/features/customers/ui/widgets/dialogs/help_dialog.dart';
import 'package:invotek/generated/l10n.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final Map<String, String> _validationErrors = {};

  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _taxNumberController;
  late TextEditingController _notesController;
  late TextEditingController _companyNameController;
  late TextEditingController _commercialRegisterController;
  late TextEditingController _cityController;
  late TextEditingController _regionController;
  late TextEditingController _postalCodeController;
  late TextEditingController _detailedAddressController;
  late TextEditingController _responsiblePersonController;

  String _selectedStatus = 'active';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });

    // Initialize controllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _taxNumberController = TextEditingController();
    _notesController = TextEditingController();
    _companyNameController = TextEditingController();
    _commercialRegisterController = TextEditingController();
    _cityController = TextEditingController();
    _regionController = TextEditingController();
    _postalCodeController = TextEditingController();
    _detailedAddressController = TextEditingController();
    _responsiblePersonController = TextEditingController();

    // Add listeners to trigger UI updates
    _nameController.addListener(_onFieldChanged);
    _emailController.addListener(_onFieldChanged);
    _phoneController.addListener(_onFieldChanged);
    _cityController.addListener(_onFieldChanged);
    _regionController.addListener(_onFieldChanged);
    _addressController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();

    // Remove listeners before disposing
    _nameController.removeListener(_onFieldChanged);
    _emailController.removeListener(_onFieldChanged);
    _phoneController.removeListener(_onFieldChanged);
    _cityController.removeListener(_onFieldChanged);
    _regionController.removeListener(_onFieldChanged);
    _addressController.removeListener(_onFieldChanged);

    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _taxNumberController.dispose();
    _notesController.dispose();
    _companyNameController.dispose();
    _commercialRegisterController.dispose();
    _cityController.dispose();
    _regionController.dispose();
    _postalCodeController.dispose();
    _detailedAddressController.dispose();
    _responsiblePersonController.dispose();
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
        title: Text(s.addCustomer),
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
      body: BlocListener<CustomersCubit, CustomersState>(
        listener: (context, state) {
          state.whenOrNull(
            createSuccess:
                (
                  customers,
                  created,
                  selectedCustomer,
                  currentPage,
                  totalPages,
                ) async {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  await messenger
                      .showSnackBar(
                        SnackBar(
                          content: Text(
                            s.customerCreatedSuccessfully(created.name),
                          ),
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
                (customers, selectedCustomer, currentPage, totalPages, error) {
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
                    Tab(text: s.customerBasicInfoSection),
                    Tab(text: s.customerAddress),
                    Tab(text: s.customerAdditionalInfo),
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
                    companyNameController: _companyNameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    taxNumberController: _taxNumberController,
                    commercialRegisterController: _commercialRegisterController,
                    validationErrors: _validationErrors,
                  ),
                  AddressInfoTab(
                    cityController: _cityController,
                    regionController: _regionController,
                    postalCodeController: _postalCodeController,
                    addressController: _addressController,
                    detailedAddressController: _detailedAddressController,
                  ),
                  AdditionalInfoTab(
                    responsiblePersonController: _responsiblePersonController,
                    notesController: _notesController,
                    selectedStatus: _selectedStatus,
                    onStatusChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedStatus = value;
                        });
                      }
                    },
                    validationErrors: _validationErrors,
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
                      onPressed: _currentTabIndex == 2
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
                        _currentTabIndex == 2 ? s.save : 'Next',
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
    if (_currentTabIndex < 2) {
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
    print('📧 Email: ${_emailController.text.trim()}');
    print('📱 Phone: ${_phoneController.text.trim()}');
    print('🏢 Status: $_selectedStatus');

    // Validate required fields manually since form is only on first tab
    if (_validateForm()) {
      print('✅ Form validation passed');
      final cubit = CustomersCubit.get(context);
      cubit.createCustomer(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
        address: _addressController.text.trim().isEmpty
            ? null
            : _addressController.text.trim(),
        taxNumber: _taxNumberController.text.trim().isEmpty
            ? null
            : _taxNumberController.text.trim(),
        notes: _notesController.text.trim().isEmpty
            ? null
            : _notesController.text.trim(),
        status: _selectedStatus,
        companyName: _companyNameController.text.trim().isEmpty
            ? null
            : _companyNameController.text.trim(),
        commercialRegister: _commercialRegisterController.text.trim().isEmpty
            ? null
            : _commercialRegisterController.text.trim(),
        city: _cityController.text.trim().isEmpty
            ? null
            : _cityController.text.trim(),
        region: _regionController.text.trim().isEmpty
            ? null
            : _regionController.text.trim(),
        postalCode: _postalCodeController.text.trim().isEmpty
            ? null
            : _postalCodeController.text.trim(),
        detailedAddress: _detailedAddressController.text.trim().isEmpty
            ? null
            : _detailedAddressController.text.trim(),
        responsiblePerson: _responsiblePersonController.text.trim().isEmpty
            ? null
            : _responsiblePersonController.text.trim(),
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
      case 1: // Address Info Tab
        isValid = _validateAddressInfoTab();
        if (!isValid) {
          errorMessage =
              'Please fill all required fields in Address Information';
        }
        break;
      case 2: // Additional Info Tab
        isValid = _validateAdditionalInfoTab();
        if (!isValid) {
          errorMessage =
              'Please fill all required fields in Additional Information';
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
            _emailController.text.trim().isNotEmpty &&
            RegExp(
              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
            ).hasMatch(_emailController.text.trim()) &&
            _phoneController.text.trim().isNotEmpty &&
            RegExp(
              r'^[+]?[\d\s\-\(\)]{7,}$',
            ).hasMatch(_phoneController.text.trim());
      case 1: // Address Info Tab
        return _cityController.text.trim().isNotEmpty &&
            _regionController.text.trim().isNotEmpty &&
            _addressController.text.trim().isNotEmpty;
      case 2: // Additional Info Tab
        return _selectedStatus.isNotEmpty;
      default:
        return false;
    }
  }

  bool _validateBasicInfoTab() {
    bool isValid = true;

    // Validate required fields for Basic Info
    if (_nameController.text.trim().isEmpty) {
      print('❌ Name is empty');
      _validationErrors['name'] = 'Customer name is required';
      isValid = false;
    }

    if (_emailController.text.trim().isEmpty) {
      print('❌ Email is empty');
      _validationErrors['email'] = 'Email is required';
      isValid = false;
    } else if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(_emailController.text.trim())) {
      print('❌ Invalid email format');
      _validationErrors['email'] = 'Invalid email format';
      isValid = false;
    }

    if (_phoneController.text.trim().isEmpty) {
      print('❌ Phone is empty');
      _validationErrors['phone'] = 'Phone number is required';
      isValid = false;
    } else if (!RegExp(
      r'^[+]?[\d\s\-\(\)]{7,}$',
    ).hasMatch(_phoneController.text.trim())) {
      print('❌ Invalid phone format');
      _validationErrors['phone'] = 'Please enter a valid phone number';
      isValid = false;
    }

    return isValid;
  }

  bool _validateAddressInfoTab() {
    bool isValid = true;

    // Validate required fields for Address Info
    if (_cityController.text.trim().isEmpty) {
      print('❌ City is empty');
      _validationErrors['city'] = 'City is required';
      isValid = false;
    }

    if (_regionController.text.trim().isEmpty) {
      print('❌ Region is empty');
      _validationErrors['region'] = 'Region is required';
      isValid = false;
    }

    if (_addressController.text.trim().isEmpty) {
      print('❌ Address is empty');
      _validationErrors['address'] = 'Address is required';
      isValid = false;
    }

    return isValid;
  }

  bool _validateAdditionalInfoTab() {
    bool isValid = true;

    // Validate required fields for Additional Info
    if (_selectedStatus.isEmpty) {
      print('❌ Status not selected');
      _validationErrors['status'] = 'Customer status is required';
      isValid = false;
    }

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

    if (!_validateAddressInfoTab()) {
      isValid = false;
    }

    if (!_validateAdditionalInfoTab()) {
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

class AddCustomerScreenWithProvider extends StatelessWidget {
  const AddCustomerScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddCustomerScreen();
  }
}
