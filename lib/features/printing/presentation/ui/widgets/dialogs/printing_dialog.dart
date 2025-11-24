import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

import '../../../cubit/printer_cubit.dart';
import '../../../cubit/printer_state.dart';

class PrintingDialog extends StatelessWidget {
  final VoidCallback onCancel;

  const PrintingDialog({
    super.key,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocBuilder<PrinterCubit, PrinterState>(
        builder: (context, state) {
          return state.maybeWhen(
            processingTemplate: () => _buildDialog(
              context: context,
              progress: null,
              message: 'جاري تجهيز القالب...',
            ),
            renderingProgress: (progress) => _buildDialog(
              context: context,
              progress: progress,
              message: 'جاري الرسم...',
            ),
            sendingToPrinter: () => _buildDialog(
              context: context,
              progress: null,
              message: 'جاري الإرسال...',
            ),
            sendingProgress: (progress) => _buildDialog(
              context: context,
              progress: progress,
              message: 'جاري الإرسال...',
            ),
            cancelling: () => _buildDialog(
              context: context,
              progress: null,
              message: 'جاري الإلغاء...',
            ),
            orElse: () => _buildDialog(
              context: context,
              progress: null,
              message: S.of(context).printingInProgress,
            ),
          );
        },
      ),
    );
  }

  Widget _buildDialog({
    required BuildContext context,
    double? progress,
    required String message,
  }) {
    return AlertDialog(
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (progress != null)
            SizedBox(
              width: double.infinity,
              child: LinearProgressIndicator(
                value: progress,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.white),
                backgroundColor: AppColors.white.withOpacity(0.3),
              ),
            )
          else
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          SizedBox(height: 16.h),
          Text(
            message,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (progress != null) ...[
            SizedBox(height: 8.h),
            Text(
              '${(progress * 100).toInt()}%',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
              ),
            ),
          ],
          SizedBox(height: 24.h),
          TextButton(
            onPressed: () {
              onCancel();
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              backgroundColor: AppColors.white,
              foregroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(S.of(context).cancel),
          ),
        ],
      ),
    );
  }
}

