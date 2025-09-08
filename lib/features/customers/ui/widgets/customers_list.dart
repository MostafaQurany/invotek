import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customer_card.dart';

class CustomersList extends StatelessWidget {
  final List<CustomerModel> customers;
  final Function(CustomerModel) onCustomerTap;
  final Function(CustomerModel) onCustomerView;
  final Function(CustomerModel) onCustomerEdit;
  final Function(CustomerModel) onCustomerDelete;

  const CustomersList({
    super.key,
    required this.customers,
    required this.onCustomerTap,
    required this.onCustomerView,
    required this.onCustomerEdit,
    required this.onCustomerDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return SliverPadding(
      padding: EdgeInsets.all(16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
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
          childCount: customers.length,
        ),
      ),
    );
  }
}
