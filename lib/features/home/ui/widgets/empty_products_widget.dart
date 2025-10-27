import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class EmptyProductsWidget extends StatelessWidget {
  final String? customTitle;
  final String? customMessage;
  final VoidCallback? onAction;
  final String? actionText;
  final IconData? icon;

  const EmptyProductsWidget({
    super.key,
    this.customTitle,
    this.customMessage,
    this.onAction,
    this.actionText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        children: [
          Icon(
            icon ?? Icons.inventory_2_outlined,
            size: 48.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16.h),
          Text(
            customTitle ?? S.of(context).noProductsSoldYet,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            customMessage ?? S.of(context).noProductsSoldMessage,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
          if (onAction != null) ...[
            SizedBox(height: 16.h),
            ElevatedButton.icon(
              onPressed: onAction,
              icon: Icon(Icons.add, size: 18.sp),
              label: Text(actionText ?? S.of(context).addNewProduct),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
