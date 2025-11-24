import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerSelectionDialog extends StatefulWidget {
  final CustomerModel? selectedCustomer;
  final Function(CustomerModel) onCustomerSelected;
  final Function()? onAddNewCustomer;

  const CustomerSelectionDialog({
    super.key,
    this.selectedCustomer,
    required this.onCustomerSelected,
    this.onAddNewCustomer,
  });

  @override
  State<CustomerSelectionDialog> createState() =>
      _CustomerSelectionDialogState();
}

class _CustomerSelectionDialogState extends State<CustomerSelectionDialog> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Timer? _searchTimer;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _scrollController.addListener(_onScroll);
    // Load customers when dialog opens
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomersCubit>().loadFirstPage(refresh: true);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchTimer?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
    });

    // Debounce search to avoid too many API calls
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 500), () {
      if (_searchQuery.isEmpty) {
        context.read<CustomersCubit>().clearSearch();
      } else {
        context.read<CustomersCubit>().searchCustomers(_searchQuery);
      }
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      final cubit = context.read<CustomersCubit>();
      if (cubit.hasMore && !cubit.isLoadingPage) {
        cubit.loadNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: double.maxFinite,
        height: 600.h,
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Header
            _buildHeader(),
            SizedBox(height: 16.h),

            // Search Bar
            _buildSearchBar(),
            SizedBox(height: 16.h),

            // Customers List
            Expanded(
              flex: 2,
              child: BlocProvider.value(
                value: context.read<CustomersCubit>(),
                child: _buildCustomersList(),
              ),
            ),

            // Bottom Actions
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.person_search, color: AppColors.primary, size: 24.sp),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            S.of(context).selectCustomer,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.close, color: AppColors.textSecondary, size: 24.sp),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: S.of(context).searchCustomers,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.textSecondary,
          size: 20.sp,
        ),
        suffixIcon: _searchQuery.isNotEmpty
            ? IconButton(
                onPressed: () {
                  _searchController.clear();
                },
                icon: Icon(
                  Icons.clear,
                  color: AppColors.textSecondary,
                  size: 20.sp,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }

  Widget _buildCustomersList() {
    return BlocBuilder<CustomersCubit, CustomersState>(
      builder: (context, state) {
        return state.when(
          initial:
              (customers, selectedCustomer, currentPage, totalPages, error) =>
                  _buildCustomersListContent(
                    customers,
                    selectedCustomer,
                    currentPage,
                    totalPages,
                  ),
          loading:
              (customers, selectedCustomer, currentPage, totalPages, message) =>
                  (customers.isNotEmpty)
                  ? _buildCustomersListContent(
                      customers,
                      selectedCustomer,
                      currentPage,
                      totalPages,
                    )
                  : _buildLoadingState(),
          loaded: (customers, selectedCustomer, currentPage, totalPages) =>
              _buildCustomersListContent(
                customers,
                selectedCustomer,
                currentPage,
                totalPages,
              ),
          createSuccess:
              (customers, created, selectedCustomer, currentPage, totalPages) =>
                  _buildCustomersListContent(
                    customers,
                    selectedCustomer,
                    currentPage,
                    totalPages,
                  ),
          updateSuccess:
              (customers, updated, selectedCustomer, currentPage, totalPages) =>
                  _buildCustomersListContent(
                    customers,
                    selectedCustomer,
                    currentPage,
                    totalPages,
                  ),
          deleteSuccess:
              (
                customers,
                deletedId,
                selectedCustomer,
                currentPage,
                totalPages,
              ) => _buildCustomersListContent(
                customers,
                selectedCustomer,
                currentPage,
                totalPages,
              ),
          failure:
              (customers, selectedCustomer, currentPage, totalPages, error) =>
                  _buildErrorState(error.message),
        );
      },
    );
  }

  Widget _buildCustomersListContent(
    List<CustomerModel> customers,
    CustomerModel? selectedCustomer,
    int currentPage,
    int totalPages,
  ) {
    if (customers.isEmpty) {
      return _buildEmptyState();
    }

    final cubit = context.read<CustomersCubit>();
    final hasMore = cubit.hasMore;
    return ListView.builder(
      controller: _scrollController,
      itemCount: customers.length + (hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == customers.length) {
          // Show loading indicator for next page
          return _buildLoadingMoreIndicator();
        }

        final customer = customers[index];
        final isSelected =
            (selectedCustomer?.id == customer.id) ||
            (widget.selectedCustomer?.id == customer.id);
        return _buildCustomerItem(customer, isSelected);
      },
    );
  }

  Widget _buildCustomerItem(CustomerModel customer, bool isSelected) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ListTile(
        onTap: () {
          // حدّث الاختيار في Cubit لضمان إعادة بناء الستايل فوراً
          context.read<CustomersCubit>().selectCustomer(customer);
          widget.onCustomerSelected(customer);
          Navigator.pop(context);
        },
        leading: CircleAvatar(
          backgroundColor: isSelected
              ? AppColors.primary
              : AppColors.backgroundLight,
          child: Text(
            customer.name.isNotEmpty ? customer.name[0].toUpperCase() : 'C',
            style: TextStyle(
              color: isSelected ? Colors.white : AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        title: Text(
          customer.name,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (customer.email.isNotEmpty)
              Text(
                customer.email,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            if (customer.phone != null && customer.phone!.isNotEmpty)
              Text(
                customer.phone!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: AppColors.primary, size: 24.sp)
            : null,
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primary),
          SizedBox(height: 16.h),
          Text(
            S.of(context).loadingCustomers,
            style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingMoreIndicator() {
    return BlocBuilder<CustomersCubit, CustomersState>(
      builder: (context, state) {
        final cubit = context.read<CustomersCubit>();
        final isLoading = cubit.isLoadingPage;

        return Container(
          padding: EdgeInsets.all(16.w),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isLoading) ...[
                  SizedBox(
                    width: 16.w,
                    height: 16.h,
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(width: 8.w),
                ],
                Text(
                  isLoading ? S.of(context).loadingMore : "تحميل المزيد",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 48.sp),
          SizedBox(height: 16.h),
          Text(
            S.of(context).errorLoadingCustomers,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            error,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              context.read<CustomersCubit>().loadFirstPage(refresh: true);
            },
            child: Text(S.of(context).retry),
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
          Icon(
            Icons.person_search,
            color: AppColors.textSecondary,
            size: 48.sp,
          ),
          SizedBox(height: 16.h),
          Text(
            _searchQuery.isEmpty
                ? S.of(context).noCustomersFound
                : S.of(context).noCustomersMatchSearch,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            _searchQuery.isEmpty
                ? S.of(context).addFirstCustomer
                : S.of(context).tryDifferentSearch,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          if (_searchQuery.isNotEmpty) ...[
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                _searchController.clear();
                context.read<CustomersCubit>().clearSearch();
              },
              child: Text(S.of(context).clearSearch),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // // Add New Customer Button
        // OutlinedButton.icon(
        //   onPressed: widget.onAddNewCustomer,
        //   icon: Icon(Icons.person_add, size: 20.sp),
        //   label: Text(S.of(context).addNewCustomer),
        //   style: OutlinedButton.styleFrom(
        //     foregroundColor: AppColors.primary,
        //     side: BorderSide(color: AppColors.primary),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(8.r),
        //     ),
        //     padding: EdgeInsets.symmetric(vertical: 12.h),
        //   ),
        // ),
        // SizedBox(height: 10.h),
        // Cancel Button
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.textSecondary,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 12.h),
          ),
          child: Text(S.of(context).cancel),
        ),
      ],
    );
  }
}
