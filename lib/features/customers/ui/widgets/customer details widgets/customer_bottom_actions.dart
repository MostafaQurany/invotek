import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class CustomerBottomActions extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool hasEditPermission;
  final bool hasDeletePermission;

  const CustomerBottomActions({
    super.key,
    required this.customer,
    required this.onEdit,
    required this.onDelete,
    required this.hasEditPermission,
    required this.hasDeletePermission,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    
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
                child: Tooltip(
                  message: hasDeletePermission
                      ? ''
                      : s.customersNoPermissionToAct,
                  child: OutlinedButton(
                    onPressed: hasDeletePermission ? onDelete : null,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.error),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      disabledForegroundColor: AppColors.error.withOpacity(0.5),
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          hasDeletePermission
                              ? Icons.delete_outline
                              : Icons.lock_outline,
                          color: hasDeletePermission
                              ? AppColors.error
                              : AppColors.error.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          s.customersDeleteAction,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: hasDeletePermission
                                ? AppColors.error
                                : AppColors.error.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: Tooltip(
                  message: hasEditPermission
                      ? ''
                      : s.customersNoPermissionToAct,
                  child: FilledButton(
                    onPressed: hasEditPermission ? onEdit : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      disabledBackgroundColor:
                          AppColors.primary.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          hasEditPermission
                              ? Icons.edit_outlined
                              : Icons.lock_outline,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          s.customersEditCustomerAction,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
