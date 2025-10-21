import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/init_dependencies_map.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';

class EditCustomerScreen extends StatefulWidget {
  final CustomerModel customer;

  const EditCustomerScreen({super.key, required this.customer});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        title: Text(s.editCustomer),
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
      body: BlocListener<CustomersCubit, CustomersState>(
        listener: (context, state) {
          state.whenOrNull(
            updateSuccess:
                (
                  customers,
                  updated,
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
                            s.customerUpdatedSuccessfully(updated.name),
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
                      content: Text(S.current.errorOccurred(error)),
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
                  Tab(text: s.customerBasicInfoSection),
                  Tab(text: s.customerAddress),
                  Tab(text: s.customerAdditionalInfo),
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
                  _buildAddressInfoTab(s),
                  _buildAdditionalInfoTab(s),
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
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentTabIndex == 2 ? s.editCustomer : 'Next',
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
            s.customerBasicInfoSection,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          _buildFormField(
            label: '${s.customerName} *',
            hint: s.customerName,
            icon: Icons.person_outline,
            initialValue: widget.customer.name,
            isRequired: true,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.customerCompanyName,
            hint: s.customerCompanyName,
            icon: Icons.business_outlined,
            initialValue: widget.customer.companyName,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.customerEmail,
            hint: 'example@email.com',
            icon: Icons.email_outlined,
            initialValue: widget.customer.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: '${s.customerPhone} *',
            hint: '0500000000',
            icon: Icons.phone_outlined,
            initialValue: widget.customer.phone,
            keyboardType: TextInputType.phone,
            isRequired: true,
          ),
        ],
      ),
    );
  }

  Widget _buildAddressInfoTab(S s) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.customerAddress,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          _buildFormField(
            label: s.customerAddress,
            hint: s.customerAddress,
            icon: Icons.location_on_outlined,
            initialValue: widget.customer.address,
            maxLines: 2,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  label: s.customerCity,
                  hint: s.customerCity,
                  icon: Icons.location_city_outlined,
                  initialValue: widget.customer.city,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildFormField(
                  label: s.customerRegion,
                  hint: s.customerRegion,
                  icon: Icons.map_outlined,
                  initialValue: widget.customer.region,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  label: s.customerPostalCode,
                  hint: s.customerPostalCode,
                  icon: Icons.local_post_office_outlined,
                  initialValue: widget.customer.postalCode,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildFormField(
                  label: s.customerTaxNumber,
                  hint: s.customerTaxNumber,
                  icon: Icons.receipt_outlined,
                  initialValue: widget.customer.taxNumber,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.customerDetailedAddress,
            hint: s.customerDetailedAddress,
            icon: Icons.home_outlined,
            initialValue: widget.customer.detailedAddress,
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoTab(S s) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.customerAdditionalInfo,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 20.h),
          _buildFormField(
            label: s.customerCommercialRegister,
            hint: s.customerCommercialRegister,
            icon: Icons.description_outlined,
            initialValue: widget.customer.commercialRegister,
          ),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.customerResponsiblePerson,
            hint: s.customerResponsiblePerson,
            icon: Icons.person_pin_outlined,
            initialValue: widget.customer.responsiblePerson,
          ),
          SizedBox(height: 16.h),
          _buildStatusDropdown(s),
          SizedBox(height: 16.h),
          _buildFormField(
            label: s.customerNotes,
            hint: s.customerNotes,
            icon: Icons.note_outlined,
            initialValue: widget.customer.notes,
            maxLines: 3,
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
              '${s.customerStatus} *',
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
          initialValue: widget.customer.status ?? 'active',
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
              child: Text(s.customerStatusActive),
            ),
            DropdownMenuItem(
              value: 'inactive',
              child: Text(s.customerStatusInactive),
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
        title: Text(s.formHelpTitle),
        content: Text(s.formHelpDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.cancel),
          ),
        ],
      ),
    );
  }

  void _goToNextTab() {
    if (_currentTabIndex < 2) {
      _tabController.animateTo(_currentTabIndex + 1);
    }
  }

  void _goToPreviousTab() {
    if (_currentTabIndex > 0) {
      _tabController.animateTo(_currentTabIndex - 1);
    }
  }

  void _handleSubmit() {
    final cubit = CustomersCubit.get(context);
    cubit.updateCustomer(
      id: widget.customer.id,
      name: widget.customer.name,
      email: widget.customer.email,
      phone: widget.customer.phone,
      address: widget.customer.address,
      taxNumber: widget.customer.taxNumber,
      notes: widget.customer.notes,
      status: widget.customer.status,
    );
  }
}

class EditCustomerScreenWithProvider extends StatelessWidget {
  final CustomerModel customer;

  const EditCustomerScreenWithProvider({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CustomersCubit>(),
      child: EditCustomerScreen(customer: customer),
    );
  }
}
