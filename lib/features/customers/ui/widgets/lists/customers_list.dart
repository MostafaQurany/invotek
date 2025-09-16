import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/cards/customer_card.dart';

class CustomersList extends StatelessWidget {
  final List<CustomerModel> customers;
  final Function(CustomerModel) onCustomerTap;
  final Function(CustomerModel) onCustomerView;
  final Function(CustomerModel) onCustomerEdit;
  final Function(CustomerModel) onCustomerDelete;
  final bool isLoadingMore;

  const CustomersList({
    super.key,
    required this.customers,
    required this.onCustomerTap,
    required this.onCustomerView,
    required this.onCustomerEdit,
    required this.onCustomerDelete,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          // Customers Count Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Customers (${customers.length})',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${customers.length} Total',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          // Customers List - Using ListView.builder for memory efficiency
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Parent SingleChildScrollView handles scrolling
            shrinkWrap: true, // Takes only the space it needs
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: customers.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == customers.length && isLoadingMore) {
                return Container(
                  padding: EdgeInsets.all(16.w),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              final customer = customers[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: CustomerCard(
                  customer: customer,
                  onTap: () => onCustomerTap(customer),
                  onEdit: () => onCustomerEdit(customer),
                  onDelete: () => onCustomerDelete(customer),
                  onView: () => onCustomerView(customer),
                  colorScheme: Theme.of(context).colorScheme,
                ),
              );
            },
          ),
          // Bottom spacing for FAB
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
