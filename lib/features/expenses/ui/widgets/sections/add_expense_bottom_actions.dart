import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class AddExpenseBottomActions extends StatelessWidget {
  final VoidCallback onSaveExpense;
  final bool isFormValid;

  const AddExpenseBottomActions({
    super.key,
    required this.onSaveExpense,
    required this.isFormValid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: Offset(0, -6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Cancel Button
          Expanded(
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                side: BorderSide(
                  color: AppColors.grey.withOpacity(0.3),
                  width: 1.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
                backgroundColor: AppColors.white,
              ),
              child: Text(
                S.of(context).cancel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),

          SizedBox(width: 16.w),

          // Save Button
          Expanded(
            child: BlocBuilder<ExpensesCubit, ExpensesState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  loading:
                      (
                        expenses,
                        selectedExpense,
                        currentPage,
                        totalPages,
                        message,
                      ) => message == 'creating',
                  orElse: () => false,
                );

                return ElevatedButton(
                  onPressed: (isLoading || !isFormValid) ? null : onSaveExpense,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isFormValid
                        ? AppColors.primary
                        : AppColors.grey.withOpacity(0.3),
                    foregroundColor: isFormValid
                        ? AppColors.white
                        : AppColors.white.withOpacity(0.6),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  child: isLoading
                      ? SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.white,
                            ),
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              S.of(context).create,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            if (!isFormValid) ...[
                              SizedBox(height: 2.h),
                              Text(
                                S.of(context).completeRequiredFields,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: AppColors.white.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ],
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
