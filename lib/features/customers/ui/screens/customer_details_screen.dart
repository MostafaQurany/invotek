import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';

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
          // Modern Header
          _buildModernHeader(customer),

          // Quick Actions
          _buildQuickActions(),

          // Content Cards
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: StaggeredAnimatedList(
                children: [
                  _buildContactInfoCard(customer),
                  SizedBox(height: 16.h),
                  _buildAccountStatusCard(customer),
                  SizedBox(height: 16.h),
                  _buildAnalyticsCard(customer),
                  SizedBox(height: 100.h), // Space for bottom actions
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Actions
      bottomNavigationBar: _buildBottomActions(),
    );
  }

  Widget _buildModernHeader(CustomerModel customer) {
    return SliverToBoxAdapter(
      child: AnimatedEntryWidget(
        delay: Duration.zero,
        child: Container(
          height: 280.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, AppColors.primary.withOpacity(0.6)],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.r),
              bottomRight: Radius.circular(32.r),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 24.sp,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () => _showHelpDialog(),
                        icon: Icon(
                          Icons.help_outline,
                          color: AppColors.white,
                          size: 24.sp,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),

                  // Customer Info
                  Row(
                    children: [
                      // Avatar
                      Container(
                        width: 80.w,
                        height: 80.w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            customer.name.isNotEmpty
                                ? customer.name[0].toUpperCase()
                                : 'C',
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 20.w),

                      // Customer Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              customer.name,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              customer.companyName ?? 'Company',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.white.withOpacity(0.8),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            _buildStatusChip(customer.status),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String status) {
    final isActive = status.toLowerCase() == 'active';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isActive ? AppColors.white : AppColors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: isActive ? AppColors.success : AppColors.error,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.primary : AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return SliverToBoxAdapter(
      child: AnimatedEntryWidget(
        delay: Duration(milliseconds: 200),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                icon: Icons.phone,
                label: 'Call',
                onTap: () => _makeCall(),
              ),
              _buildActionButton(
                icon: Icons.email,
                label: 'Email',
                onTap: () => _sendEmail(),
              ),
              _buildActionButton(
                icon: Icons.receipt,
                label: 'Invoices',
                onTap: () => _viewInvoices(),
              ),
              _buildActionButton(
                icon: Icons.shopping_cart,
                label: 'Orders',
                onTap: () => _viewOrders(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 70.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: AppColors.primary, size: 24.sp),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoCard(CustomerModel customer) {
    return AnimatedCard(
      delay: Duration(milliseconds: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.contact_phone, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Email
          _buildInfoTile(
            icon: Icons.email_outlined,
            label: 'Email',
            value: customer.email,
            onAction: () => _copyToClipboard(customer.email),
            actionLabel: 'Copy',
          ),

          SizedBox(height: 16.h),

          // Phone
          _buildInfoTile(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: customer.phone ?? 'Not provided',
            onAction: customer.phone != null ? () => _makeCall() : null,
            actionLabel: 'Call',
          ),

          SizedBox(height: 16.h),

          // Address
          _buildInfoTile(
            icon: Icons.location_on_outlined,
            label: 'Address',
            value: customer.address ?? 'Not provided',
            onAction: customer.address != null ? () => _openMap() : null,
            actionLabel: 'Map',
          ),
        ],
      ),
    );
  }

  Widget _buildAccountStatusCard(CustomerModel customer) {
    return AnimatedCard(
      delay: Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle_outlined,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                'Account Status',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Status
          _buildInfoTile(
            icon: Icons.flag_outlined,
            label: 'Status',
            value: customer.status.toUpperCase(),
            valueColor: customer.status.toLowerCase() == 'active'
                ? AppColors.success
                : AppColors.error,
          ),

          SizedBox(height: 16.h),

          // Created Date
          _buildInfoTile(
            icon: Icons.calendar_today_outlined,
            label: 'Created',
            value: _formatDate(customer.createdAt),
          ),

          SizedBox(height: 16.h),

          // Last Updated
          _buildInfoTile(
            icon: Icons.update_outlined,
            label: 'Last Updated',
            value: _formatDate(customer.updatedAt),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsCard(CustomerModel customer) {
    return AnimatedCard(
      delay: Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                'Quick Insights',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.receipt_long,
                  label: 'Invoices',
                  value: '12',
                  subtitle: '8 Paid',
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.shopping_cart,
                  label: 'Orders',
                  value: '24',
                  subtitle: 'SAR 15,420',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greyDark,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            subtitle,
            style: TextStyle(fontSize: 10.sp, color: AppColors.greyDark),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    String? actionLabel,
    VoidCallback? onAction,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greyDark, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        if (onAction != null && actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                actionLabel,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomActions() {
    return AnimatedEntryWidget(
      delay: Duration(milliseconds: 1000),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _showDeleteConfirmation(),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.error),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.delete_outline,
                        color: AppColors.error,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: () => _editCustomer(),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.edit_outlined,
                        color: AppColors.white,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Edit Customer',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Methods
  String _formatDate(DateTime? date) {
    if (date == null) return 'Not available';
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _makeCall() {
    if (widget.customer.phone != null) {
      // Implement phone call functionality
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Calling ${widget.customer.phone}'),
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
          content: Text('Opening email to ${widget.customer.email}'),
          backgroundColor: AppColors.primary,
        ),
      );
    }
  }

  void _viewInvoices() {
    // Navigate to invoices
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing invoices for ${widget.customer.name}'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _viewOrders() {
    // Navigate to orders
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Viewing orders for ${widget.customer.name}'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied to clipboard'),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _openMap() {
    // Implement map functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening map'),
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
          'Delete Customer',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        content: Text(
          'Are you sure you want to delete ${widget.customer.name}? This action cannot be undone.',
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              customersCubit.deleteCustomer(widget.customer.id ?? 0);
              Navigator.pop(context, 'deleted'); // Go back to list with result
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: Text('Delete'),
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
            Text('Help'),
          ],
        ),
        content: Text(
          'This screen shows detailed information about the customer including contact details, account status, and quick insights.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
