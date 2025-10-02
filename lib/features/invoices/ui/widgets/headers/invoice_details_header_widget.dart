import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceDetailsHeaderWidget extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback onBack;
  final VoidCallback onEdit;

  const InvoiceDetailsHeaderWidget({
    super.key,
    required this.invoice,
    required this.onBack,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Row
          Row(
            children: [
              // Back Button
              IconButton(
                onPressed: onBack,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textPrimary,
                  size: 24.sp,
                ),
              ),

              SizedBox(width: 8.w),

              // Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).invoiceDetails,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      invoice.invoiceNumber ?? "Invoice Number",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),

              // Action Buttons
              Row(
                children: [
                  // Edit Button
                  IconButton(
                    onPressed: onEdit,
                    icon: Icon(
                      Icons.edit,
                      color: AppColors.primary,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Invoice Status
          _buildStatusRow(context),
        ],
      ),
    );
  }

  Widget _buildStatusRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          // Status Icon
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: _getStatusColor(
                invoice.status ?? "pending",
              ).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              _getStatusIcon(invoice.status ?? "pending"),
              color: _getStatusColor(invoice.status ?? "pending"),
              size: 20.sp,
            ),
          ),

          SizedBox(width: 12.w),

          // Status Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).status,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  _getStatusText(invoice.status ?? "pending"),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(invoice.status ?? "pending"),
                  ),
                ),
              ],
            ),
          ),

          // Amount
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                S.of(context).total,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                NumberFormat.currency(
                  symbol:
                      context.read<LocalizationCubit>().getCurrentLanguage() ==
                          'ar'
                      ? AppCurrency.currencyAr
                      : AppCurrency.currencyEn,
                ).format(double.tryParse(invoice.total ?? '0.00') ?? 0),

                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return AppColors.success;
      case 'pending':
        return AppColors.warning;
      case 'overdue':
        return AppColors.error;
      case 'draft':
        return AppColors.textSecondary;
      default:
        return AppColors.textSecondary;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return Icons.check_circle;
      case 'pending':
        return Icons.schedule;
      case 'overdue':
        return Icons.warning;
      case 'draft':
        return Icons.edit;
      default:
        return Icons.info;
    }
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return S.current.paid;
      case 'pending':
        return S.current.pending;
      case 'overdue':
        return S.current.overdue;
      case 'draft':
        return S.current.draft;
      default:
        return status;
    }
  }
}
