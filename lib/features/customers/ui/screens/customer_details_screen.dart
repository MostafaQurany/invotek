import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/domain/usecases/get_customer_invoices.dart';
import 'package:invotek/features/customers/ui/widgets/customer details widgets/widgets.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerDetailsScreen extends StatefulWidget {
  final CustomerModel customer;

  const CustomerDetailsScreen({super.key, required this.customer});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final customer = widget.customer;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Modern Header with Animation
          SliverToBoxAdapter(
            child: CustomerDetailsHeader(
              customer: customer,
              onBackPressed: () => Navigator.pop(context),
              onHelpPressed: () => _showHelpDialog(),
            ),
          ),

          // Quick Actions with Animation
          SliverToBoxAdapter(
            child: CustomerQuickActions(
              onCall: () => _makeCall(),
              onEmail: () => _sendEmail(),
              onInvoices: () => _viewInvoices(),
              // onOrders: () => _viewOrders(),
            ),
          ),

          // Content Cards with Staggered Animation
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: StaggeredAnimatedList(
                staggerDelay: Duration(milliseconds: 150),
                children: [
                  CustomerContactInfoCard(
                    customer: customer,
                    onCopyEmail: () => _copyToClipboard(customer.email),
                    onCall: customer.phone != null ? () => _makeCall() : null,
                    onOpenMap: customer.address != null
                        ? () => _openMap()
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomerAccountStatusCard(
                    customer: customer,
                    formatDate: _formatDate,
                  ),
                  SizedBox(height: 16.h),
                  BlocProvider(
                    create: (context) =>
                        CustomerInvoicesCubit(getIt<GetCustomerInvoices>())
                          ..loadCustomerInvoices(customer.id),
                    child: CustomerAnalyticsCard(customer: customer),
                  ),
                  SizedBox(height: 100.h), // Space for bottom actions
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Actions with Animation
      bottomNavigationBar: CustomerBottomActions(
        customer: customer,
        onEdit: () => _editCustomer(),
        onDelete: () => _showDeleteConfirmation(),
      ),
    );
  }

  // Helper Methods
  String _formatDate(DateTime? date) {
    if (date == null) return S.of(context).undefined;
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _makeCall() {
    if (widget.customer.phone != null) {
      // Implement phone call functionality
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).calling(widget.customer.phone!)),
          backgroundColor: AppColors.primary,
        ),
      );
    }
  }

  void _sendEmail() {
    if (widget.customer.email.isNotEmpty) {
      // Implement email functionality
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).openingEmail(widget.customer.email)),
          backgroundColor: AppColors.primary,
        ),
      );
    }
  }

  void _viewInvoices() {
    // Navigate to invoices
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).viewingInvoices(widget.customer.name)),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).copiedToClipboard),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _openMap() {
    // Implement map functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).openingMap),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _editCustomer() {
    Navigator.pushNamed(context, '/customers/edit', arguments: widget.customer);
  }

  void _showDeleteConfirmation() {
    final customersCubit = CustomersCubit.get(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          S.of(context).confirmDeleteCustomer,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        content: Text(
          S.of(context).confirmDeleteCustomerMessage(widget.customer.name),
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              customersCubit.deleteCustomer(widget.customer.id);
              Navigator.pop(context, 'deleted'); // Go back to list with result
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.help_outline, color: AppColors.primary),
            SizedBox(width: 8.w),
            Text(S.of(context).help),
          ],
        ),
        content: Text(S.of(context).customerFormHelpDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }
}
