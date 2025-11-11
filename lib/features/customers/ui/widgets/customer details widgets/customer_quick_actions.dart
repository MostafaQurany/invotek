import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerQuickActions extends StatelessWidget {
  final VoidCallback onCall;
  final VoidCallback onEmail;
  final VoidCallback onInvoices;
  //final VoidCallback onOrders;

  const CustomerQuickActions({
    super.key,
    required this.onCall,
    required this.onEmail,
    required this.onInvoices,
    // required this.onOrders,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return AnimatedEntryWidget(
      delay: Duration(milliseconds: 200),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionButton(icon: Icons.phone, label: s.customersCall, onTap: onCall),
            _buildActionButton(
              icon: Icons.email,
              label: s.email,
              onTap: onEmail,
            ),
            _buildActionButton(
              icon: Icons.receipt,
              label: s.invoices,
              onTap: onInvoices,
            ),
            // _buildActionButton(
            //   icon: Icons.shopping_cart,
            //   label: 'Orders',
            //   onTap: onOrders,
            // ),
          ],
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
        width: 100.w,
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
}
