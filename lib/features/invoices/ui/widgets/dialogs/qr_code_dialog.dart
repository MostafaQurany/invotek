import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:invotek/generated/l10n.dart';

/// حوار عرض رمز QR للفاتورة
class QRCodeDialog extends StatelessWidget {
  final String qrCode;
  final String invoiceNumber;

  const QRCodeDialog({
    super.key,
    required this.qrCode,
    required this.invoiceNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.qr_code, color: AppColors.primary, size: 24.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    S.of(context).viewQRCode,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                    size: 20.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Invoice Number
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                '${S.of(context).invoiceNumber}: $invoiceNumber',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // QR Code Display
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.border, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // QR Code Display
                  Container(
                    width: 200.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: QrImageView(
                      data: qrCode,
                      version: QrVersions.auto,
                      size: 200.w,
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primary,
                      errorStateBuilder: (context, error) {
                        return Container(
                          width: 200.w,
                          height: 200.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code,
                                size: 80.sp,
                                color: AppColors.primary,
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'رمز QR',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // // Action Buttons
            // Row(
            //   children: [
            //     // Copy QR Code
            //     Expanded(
            //       child: OutlinedButton.icon(
            //         onPressed: () => _copyQRCode(context),
            //         icon: Icon(Icons.copy, size: 16.sp),
            //         label: Text(
            //           S.of(context).copy,
            //           style: TextStyle(fontSize: 14.sp),
            //         ),
            //         style: OutlinedButton.styleFrom(
            //           foregroundColor: AppColors.primary,
            //           side: BorderSide(color: AppColors.primary),
            //           padding: EdgeInsets.symmetric(vertical: 12.h),
            //         ),
            //       ),
            //     ),

            //     //              SizedBox(width: 12.w),

            //     // // Share QR Code
            //     // Expanded(
            //     //   child: ElevatedButton.icon(
            //     //     onPressed: () => _shareQRCode(context),
            //     //     icon: Icon(Icons.share, size: 16.sp),
            //     //     label: Text(
            //     //       S.of(context).shareInvoice,
            //     //       style: TextStyle(fontSize: 14.sp),
            //     //     ),
            //     //     style: ElevatedButton.styleFrom(
            //     //       backgroundColor: AppColors.primary,
            //     //       foregroundColor: Colors.white,
            //     //       padding: EdgeInsets.symmetric(vertical: 12.h),
            //     //     ),
            //     //   ),
            //     // ),
            //   ],
            // ),
            SizedBox(height: 16.h),

            // Info Text
            Text(
              'يمكن مسح هذا الرمز للوصول إلى تفاصيل الفاتورة',
              style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _copyQRCode(BuildContext context) {
    Clipboard.setData(ClipboardData(text: qrCode));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).taxUIDCopied),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _shareQRCode(BuildContext context) {
    // TODO: Implement share QR code functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).shareInvoice),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
