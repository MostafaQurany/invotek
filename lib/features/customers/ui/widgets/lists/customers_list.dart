import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/cards/customer_card.dart';

class CustomersList extends StatelessWidget {
  final List<CustomerModel> customers;
  final Function(CustomerModel) onCustomerTap;
  final Function(CustomerModel) onCustomerView;
  final Function(CustomerModel) onCustomerEdit;
  final Function(CustomerModel) onCustomerDelete;
  final bool isLoadingMore;
  final ScrollController? scrollController;

  const CustomersList({
    super.key,
    required this.customers,
    required this.onCustomerTap,
    required this.onCustomerView,
    required this.onCustomerEdit,
    required this.onCustomerDelete,
    this.isLoadingMore = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35.h),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
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
        ),
      ],
    );
  }
}
