import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Customers Count Header
          Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Row(
              children: [
                Text(
                  'Customers (${customers.length})',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${customers.length} Total',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Customers List
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: customers.length + (isLoadingMore ? 1 : 0),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) {
                if (index == customers.length && isLoadingMore) {
                  return Container(
                    padding: EdgeInsets.all(16.w),
                    child: const Center(child: CircularProgressIndicator()),
                  );
                }
                final customer = customers[index];
                return CustomerCard(
                  customer: customer,
                  onTap: () => onCustomerTap(customer),
                  onEdit: () => onCustomerEdit(customer),
                  onDelete: () => onCustomerDelete(customer),
                  onView: () => onCustomerView(customer),
                  colorScheme: colorScheme,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
