import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_menu_button.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/generated/l10n.dart';

class InvoicesHeaderWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final String? selectedStatus;
  final String? selectedPaymentMethod;
  final String? selectedCustomer;
  final Function(String?) onStatusChanged;
  final Function(String?) onPaymentMethodChanged;
  final Function(String?) onCustomerChanged;
  final VoidCallback onRefresh;

  const InvoicesHeaderWidget({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.selectedStatus,
    required this.selectedPaymentMethod,
    required this.selectedCustomer,
    required this.onStatusChanged,
    required this.onPaymentMethodChanged,
    required this.onCustomerChanged,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          // Title and Refresh Button
          Row(
            children: [
              // Menu Button
              CommonMenuButton(color: AppColors.primary),

              Expanded(
                child: Center(
                  child: Text(
                    S.of(context).invoices,
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: onRefresh,
                icon: Icon(
                  Icons.refresh,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Search Bar
          CommonSearchBar(
            controller: searchController,
            hintText: S.of(context).searchInvoices,
            onChanged: onSearchChanged,
          ),

          SizedBox(height: 16.h),

          // // Filter Row
          // CommonFilterRow(
          //   filters: [
          //     FilterItem(
          //       label: S.of(context).status,
          //       value: selectedStatus ?? 'all',
          //       options: [
          //         FilterOption(value: 'all', label: S.of(context).allStatus),
          //         FilterOption(value: 'draft', label: S.of(context).draft),
          //         FilterOption(value: 'pending', label: S.of(context).pending),
          //         FilterOption(value: 'paid', label: S.of(context).paid),
          //         FilterOption(value: 'overdue', label: S.of(context).overdue),
          //       ],
          //       onChanged: onStatusChanged,
          //     ),
          //     FilterItem(
          //       label: S.of(context).paymentMethod,
          //       value: selectedPaymentMethod ?? 'all',
          //       options: [
          //         FilterOption(
          //           value: 'all',
          //           label: S.of(context).allPaymentMethods,
          //         ),
          //         FilterOption(value: 'cash', label: S.of(context).cash),
          //         FilterOption(value: 'card', label: S.of(context).card),
          //         FilterOption(
          //           value: 'bank_transfer',
          //           label: S.of(context).bankTransfer,
          //         ),
          //         FilterOption(value: 'check', label: S.of(context).check),
          //       ],
          //       onChanged: onPaymentMethodChanged,
          //     ),
          //     FilterItem(
          //       label: S.of(context).customer,
          //       value: selectedCustomer ?? 'all',
          //       options: [
          //         FilterOption(value: 'all', label: S.of(context).allCustomers),
          //         // TODO: Add customer options from API
          //       ],
          //       onChanged: onCustomerChanged,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
