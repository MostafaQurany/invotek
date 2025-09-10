import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/ui/widgets/dialogs/help_dialog_widget.dart';
import 'package:invotek/generated/l10n.dart';

class AddExpenseHeaderWidget extends StatelessWidget {
  const AddExpenseHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary.withOpacity(0.9),
            AppColors.primary.withOpacity(0.7),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            children: [
              // Top Navigation Row
              Row(
                children: [
                  // Back Button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      // padding: EdgeInsets.symmetric(
                      //   horizontal: 12.w,
                      //   vertical: 8.h,
                      // ),
                      // decoration: BoxDecoration(
                      //   //  color: Colors.white.withOpacity(0.2),
                      //   borderRadius: BorderRadius.circular(20.r),
                      //   border: Border.all(
                      //     color: Colors.white.withOpacity(0.3),
                      //     width: 1,
                      //   ),
                      // ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                  Spacer(),
                  // Help Button
                  GestureDetector(
                    onTap: () => HelpDialogWidget.show(context),
                    child: Container(
                      child: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              // Centered Title
              Text(
                S.of(context).newExpense,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 8.h),

              Text(
                S.of(context).trackYourBusinessExpenses,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.white.withOpacity(0.9),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
