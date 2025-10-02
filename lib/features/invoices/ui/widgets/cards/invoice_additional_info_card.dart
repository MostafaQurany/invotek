import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// بطاقة المعلومات الإضافية للفاتورة
class InvoiceAdditionalInfoCard extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback? onQRCodeTap;
  final VoidCallback? onTaxUIDTap;

  const InvoiceAdditionalInfoCard({
    super.key,
    required this.invoice,
    this.onQRCodeTap,
    this.onTaxUIDTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.info_outline,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'معلومات إضافية',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'تفاصيل إضافية للفاتورة',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Additional Information
          Column(
            children: [
              // Invoice Type
              if (invoice.invoiceType?.isNotEmpty ?? false)
                _buildInfoRow(
                  icon: Icons.receipt_long,
                  label: 'نوع الفاتورة',
                  value: _getInvoiceTypeText(invoice.invoiceType ?? ''),
                ),

              if (invoice.invoiceType?.isNotEmpty ?? false)
                SizedBox(height: 12.h),

              // // Document Type
              // if (invoice.documentType?.isNotEmpty ?? false)
              //   _buildInfoRow(
              //     icon: Icons.description,
              //     label: 'نوع المستند',
              //     value: _getDocumentTypeText(invoice.documentType ?? ''),
              //   ),

              // if (invoice.documentType?.isNotEmpty ?? false)
              //   SizedBox(height: 12.h),

              // Description
              if (invoice.description?.isNotEmpty ?? false)
                _buildInfoRow(
                  icon: Icons.notes,
                  label: 'الوصف',
                  value: invoice.description ?? '',
                  isMultiline: true,
                ),

              if (invoice.description?.isNotEmpty ?? false)
                SizedBox(height: 12.h),

              // Sent At
              if (invoice.sentAt?.isNotEmpty ?? false)
                _buildInfoRow(
                  icon: Icons.send,
                  label: 'تاريخ الإرسال',
                  value: _formatDate(invoice.sentAt ?? ''),
                ),

              if (invoice.sentAt?.isNotEmpty ?? false) SizedBox(height: 12.h),

              // // Created At
              // if (invoice.createdAt?.isNotEmpty ?? false)
              //   _buildInfoRow(
              //     icon: Icons.add_circle,
              //     label: 'تاريخ الإنشاء',
              //     value: _formatDate(invoice.createdAt ?? ''),
              //   ),

              // if (invoice.createdAt?.isNotEmpty ?? false)
              //   SizedBox(height: 12.h),

              // // Updated At
              // if (invoice.updatedAt?.isNotEmpty ?? false)
              //   _buildInfoRow(
              //     icon: Icons.update,
              //     label: 'تاريخ التحديث',
              //     value: _formatDate(invoice.updatedAt ?? ''),
              //   ),
              // if (invoice.updatedAt?.isNotEmpty ?? false)
              //   SizedBox(height: 12.h),
              // if (invoice.taxUid?.isNotEmpty ?? false) SizedBox(height: 12.h),

              // QR Code
              if (invoice.qrCode?.isNotEmpty ?? false)
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
                    data: invoice.qrCode!,
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

              if (invoice.qrCode?.isNotEmpty ?? false) SizedBox(height: 12.h),

              // Error Message
              if (invoice.errorMessage?.isNotEmpty ?? false)
                _buildErrorRow(
                  icon: Icons.error_outline,
                  label: 'رسالة الخطأ',
                  value: invoice.errorMessage ?? '',
                ),

              if (invoice.errorMessage?.isNotEmpty ?? false)
                SizedBox(height: 12.h),

              // // Company ID
              // if (invoice.companyId != null)
              //   _buildInfoRow(
              //     icon: Icons.business,
              //     label: 'معرف الشركة',
              //     value: invoice.companyId.toString(),
              //   ),

              // if (invoice.companyId != null) SizedBox(height: 12.h),

              // // Customer ID
              // if (invoice.customerId != null)
              //   _buildInfoRow(
              //     icon: Icons.person,
              //     label: 'معرف العميل',
              //     value: invoice.customerId.toString(),
              //   ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    bool isMultiline = false,
    bool isClickable = false,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isClickable ? onTap : null,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: isClickable
                ? AppColors.primary.withOpacity(0.05)
                : AppColors.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.r),
            border: isClickable
                ? Border.all(
                    color: AppColors.primary.withOpacity(0.2),
                    width: 1,
                  )
                : null,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 16.sp,
                color: isClickable
                    ? AppColors.primary
                    : AppColors.textSecondary,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: isMultiline ? null : 1,
                      overflow: isMultiline ? null : TextOverflow.ellipsis,
                    ),
                    if (isClickable) ...[
                      SizedBox(height: 2.h),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.sp,
                        color: AppColors.primary,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.error.withOpacity(0.2), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16.sp, color: AppColors.error),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.error,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getInvoiceTypeText(String invoiceType) {
    switch (invoiceType.toLowerCase()) {
      case 'standard':
        return 'فاتورة عادية';
      case 'credit_note':
        return 'إشعار دائن';
      case 'debit_note':
        return 'إشعار مدين';
      case 'proforma':
        return 'فاتورة مؤقتة';
      default:
        return invoiceType;
    }
  }

  String _getDocumentTypeText(String documentType) {
    switch (documentType.toLowerCase()) {
      case 'invoice':
        return 'فاتورة';
      case 'receipt':
        return 'إيصال';
      case 'quote':
        return 'عرض سعر';
      case 'estimate':
        return 'تقدير';
      default:
        return documentType;
    }
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('dd/MM/yyyy HH:mm').format(date);
    } catch (e) {
      return dateString;
    }
  }
}
