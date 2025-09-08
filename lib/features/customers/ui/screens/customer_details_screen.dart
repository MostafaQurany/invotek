import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/screens/edit_customer_screen.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final CustomerModel customer;

  const CustomerDetailsScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.customerDetails),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.copy, color: AppColors.primary),
            onPressed: () => _copyCustomerData(context, s),
            tooltip: s.copy,
          ),
          IconButton(
            icon: Icon(Icons.edit, color: AppColors.primary),
            onPressed: () => _navigateToEdit(context),
            tooltip: s.edit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer Profile Card
            _buildProfileCard(context, s),

            SizedBox(height: 24.h),

            // Contact Information Card
            _buildContactInfoCard(context, s),

            SizedBox(height: 24.h),

            // Status Information Card
            _buildStatusInfoCard(context, s),

            SizedBox(height: 32.h),

            // Action Buttons
            _buildActionButtons(context, s),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(BuildContext context, S s) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(32.w),
        child: Column(
          children: [
            // Enhanced Avatar with better styling
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  customer.name.isNotEmpty
                      ? customer.name[0].toUpperCase()
                      : 'C',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // Customer Name
            Text(
              customer.name,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 8.h),

            // Company Name (if available)
            if (customer.companyName != null &&
                customer.companyName!.isNotEmpty)
              Text(
                customer.companyName!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.greyDark,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),

            SizedBox(height: 16.h),

            // Enhanced Status Chip
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: customer.status == 'active'
                    ? AppColors.primary
                    : AppColors.error,
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color:
                        (customer.status == 'active'
                                ? AppColors.primary
                                : AppColors.error)
                            .withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    customer.status == 'active' ? Icons.check : Icons.close,
                    color: AppColors.white,
                    size: 16.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    customer.status == 'active' ? s.active : s.inactive,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
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

  Widget _buildContactInfoCard(BuildContext context, S s) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.contact_phone_outlined,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  s.contactInfo,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Email
            _buildContactRow(
              icon: Icons.email_outlined,
              label: s.email,
              value: customer.email,
              iconColor: AppColors.primary,
            ),

            // Phone
            if (customer.phone != null && customer.phone!.isNotEmpty)
              _buildContactRow(
                icon: Icons.phone_outlined,
                label: s.customerPhone,
                value: customer.phone!,
                iconColor: AppColors.primary,
              ),

            // Address
            if (customer.address != null && customer.address!.isNotEmpty)
              _buildContactRow(
                icon: Icons.location_on_outlined,
                label: s.customerAddress,
                value: customer.address!,
                iconColor: AppColors.primary,
                maxLines: 2,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusInfoCard(BuildContext context, S s) {
    return Card(
      elevation: 2,
      shadowColor: AppColors.black.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Header
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.info_outlined,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  s.statusInfo,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // Status Row
            Row(
              children: [
                Icon(
                  customer.status == 'active'
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: customer.status == 'active'
                      ? AppColors.primary
                      : AppColors.error,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Text(
                  s.status,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: customer.status == 'active'
                        ? AppColors.primary
                        : AppColors.error,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    customer.status == 'active' ? s.active : s.inactive,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),
            if (customer.createdAt != null)
              // Created Date
              _buildStatusRow(
                icon: Icons.calendar_today_outlined,
                label: s.createdDate,
                value: _formatDate(customer.createdAt!),
              ),

            SizedBox(height: 12.h),

            if (customer.updatedAt != null)
              // Last Updated
              _buildStatusRow(
                icon: Icons.update_outlined,
                label: s.lastUpdated,
                value: _formatDate(customer.updatedAt!),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20.sp, color: iconColor),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyDark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    fontFamily: maxLines > 1 ? null : 'monospace',
                  ),
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: AppColors.greyDark),
        SizedBox(width: 12.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.greyDark,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w500,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, S s) {
    return Row(
      children: [
        // Delete Button (Red Outlined)
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showDeleteConfirmation(context, s),
            icon: Icon(Icons.delete_outline, size: 20.sp),
            label: Text(s.delete),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: BorderSide(color: AppColors.error, width: 1.5),
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ),

        SizedBox(width: 16.w),

        // Edit Button (Primary Filled)
        Expanded(
          flex: 2,
          child: FilledButton.icon(
            onPressed: () => _navigateToEdit(context),
            icon: Icon(Icons.edit, size: 20.sp),
            label: Text(s.editCustomer),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 2,
              shadowColor: AppColors.primary.withOpacity(0.3),
            ),
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
  }

  void _navigateToEdit(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCustomerScreen(customer: customer),
      ),
    );
  }

  void _copyCustomerData(BuildContext context, S s) {
    // Create a formatted string with all customer data
    final StringBuffer customerData = StringBuffer();

    customerData.writeln('${s.customerDetails} - ${customer.name}');
    customerData.writeln('=' * 30);
    customerData.writeln();

    // Basic Information
    customerData.writeln(s.basicInformation);
    customerData.writeln('${s.customerName}: ${customer.name}');
    if (customer.companyName != null && customer.companyName!.isNotEmpty) {
      customerData.writeln('${s.customerCompanyName}: ${customer.companyName}');
    }
    customerData.writeln('${s.email}: ${customer.email}');
    if (customer.phone != null && customer.phone!.isNotEmpty) {
      customerData.writeln('${s.customerPhone}: ${customer.phone}');
    }
    customerData.writeln();

    // Address Information
    if (customer.address != null && customer.address!.isNotEmpty) {
      customerData.writeln(s.addressInformation);
      customerData.writeln('${s.customerAddress}: ${customer.address}');
      if (customer.city != null && customer.city!.isNotEmpty) {
        customerData.writeln('${s.customerCity}: ${customer.city}');
      }
      if (customer.region != null && customer.region!.isNotEmpty) {
        customerData.writeln('${s.customerRegion}: ${customer.region}');
      }
      if (customer.postalCode != null && customer.postalCode!.isNotEmpty) {
        customerData.writeln('${s.customerPostalCode}: ${customer.postalCode}');
      }
      if (customer.detailedAddress != null &&
          customer.detailedAddress!.isNotEmpty) {
        customerData.writeln(
          '${s.customerDetailedAddress}: ${customer.detailedAddress}',
        );
      }
      customerData.writeln();
    }

    // Additional Information
    customerData.writeln(s.additionalInformation);
    customerData.writeln(
      '${s.status}: ${customer.status == 'active' ? s.active : s.inactive}',
    );
    if (customer.taxNumber != null && customer.taxNumber!.isNotEmpty) {
      customerData.writeln('${s.customerTaxNumber}: ${customer.taxNumber}');
    }
    if (customer.commercialRegister != null &&
        customer.commercialRegister!.isNotEmpty) {
      customerData.writeln(
        '${s.customerCommercialRegister}: ${customer.commercialRegister}',
      );
    }
    if (customer.responsiblePerson != null &&
        customer.responsiblePerson!.isNotEmpty) {
      customerData.writeln(
        '${s.customerResponsiblePerson}: ${customer.responsiblePerson}',
      );
    }
    if (customer.notes != null && customer.notes!.isNotEmpty) {
      customerData.writeln('${s.customerNotes}: ${customer.notes}');
    }

    // Dates
    if (customer.createdAt != null) {
      customerData.writeln(
        '${s.createdDate}: ${_formatDate(customer.createdAt!)}',
      );
    }
    if (customer.updatedAt != null) {
      customerData.writeln(
        '${s.lastUpdated}: ${_formatDate(customer.updatedAt!)}',
      );
    }

    // Copy to clipboard
    Clipboard.setData(ClipboardData(text: customerData.toString()));

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s.customerDataCopied),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, S s) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.warning_amber_outlined, color: AppColors.error),
            SizedBox(width: 8.w),
            Text(s.confirmDelete),
          ],
        ),
        content: Text(s.deleteCustomerConfirmation(customer.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context, 'deleted'); // Go back to list with result
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.white,
            ),
            child: Text(s.delete),
          ),
        ],
      ),
    );
  }
}
