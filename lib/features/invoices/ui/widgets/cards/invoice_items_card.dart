import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceItemsCard extends StatefulWidget {
  final List<InvoiceItem> items;
  final Function(InvoiceItem)? onItemTap;

  const InvoiceItemsCard({super.key, required this.items, this.onItemTap});

  @override
  State<InvoiceItemsCard> createState() => _InvoiceItemsCardState();
}

class _InvoiceItemsCardState extends State<InvoiceItemsCard> {
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
                  Icons.shopping_cart,
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
                      S.of(context).items,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${widget.items.length} ${S.of(context).items}',
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

          // Items List
          if (widget.items.isEmpty)
            Center(child: _buildEmptyState())
          else
            Column(
              children: widget.items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return Column(
                  children: [
                    _buildItemRow(item, index + 1),
                    if (index < widget.items.length - 1) SizedBox(height: 12.h),
                  ],
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 48.sp,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 12.h),
          Text(
            S.current.noItems,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            S.current.addItemsToInvoice,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildItemRow(InvoiceItem item, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onItemTap != null ? () => widget.onItemTap!(item) : null,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: AppColors.border, width: 1),
          ),
          child: Row(
            children: [
              // Item Number
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    '$index',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // Item Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? "Item Name",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (item.description?.isNotEmpty ?? false) ...[
                      SizedBox(height: 2.h),
                      Text(
                        item.description ?? "No Description",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    SizedBox(height: 4.h),
                    Wrap(
                      children: [
                        Text(
                          '${S.current.qty}: ${item.quantity}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          '${S.current.price}: ${NumberFormat.currency(symbol: context.read<LocalizationCubit>().getCurrentLanguage() == 'ar' ? AppCurrency.currencyAr : AppCurrency.currencyEn).format(double.tryParse(item.price ?? '0.00') ?? 0)}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Total Amount
              Expanded(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      NumberFormat.currency(
                        symbol:
                            context
                                    .read<LocalizationCubit>()
                                    .getCurrentLanguage() ==
                                'ar'
                            ? AppCurrency.currencyAr
                            : AppCurrency.currencyEn,
                      ).format(double.tryParse(item.total ?? '0.00') ?? 0),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    if (widget.onItemTap != null) ...[
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12.sp,
                        color: AppColors.textSecondary,
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
}
