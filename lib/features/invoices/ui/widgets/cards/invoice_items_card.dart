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
  bool _isExpanded = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<InvoiceItem> get _filteredItems {
    if (_searchQuery.isEmpty) return widget.items;
    return widget.items.where((item) {
      final name = item.name?.toLowerCase() ?? '';
      final description = item.description?.toLowerCase() ?? '';
      final price = item.price ?? '';
      final total = item.total ?? '';
      final id = item.id?.toString() ?? '';
      final query = _searchQuery.toLowerCase();

      return name.contains(query) ||
          description.contains(query) ||
          price.contains(query) ||
          total.contains(query) ||
          id.contains(query);
    }).toList();
  }

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

          // Items Table
          if (widget.items.isEmpty)
            Center(child: _buildEmptyState())
          else
            _buildItemsSection(),
        ],
      ),
    );
  }

  Widget _buildItemsSection() {
    final hasManyItems = widget.items.length > 6;
    final itemsToShow = _isExpanded
        ? _filteredItems
        : _filteredItems.take(6).toList();

    return Column(
      children: [
        // Search Bar (if has many items)
        if (hasManyItems) ...[_buildSearchBar(), SizedBox(height: 16.h)],

        // Items Display
        _buildResponsiveTable(itemsToShow),

        // Expand/Collapse Button (if has many items)
        if (hasManyItems) ...[SizedBox(height: 16.h), _buildExpandButton()],
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.textSecondary, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: S.of(context).searchItems,
                hintStyle: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
            ),
          ),
          if (_searchQuery.isNotEmpty)
            GestureDetector(
              onTap: () {
                _searchController.clear();
                setState(() {
                  _searchQuery = '';
                });
              },
              child: Icon(
                Icons.clear,
                color: AppColors.textSecondary,
                size: 20.sp,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildExpandButton() {
    final hasMoreItems = _filteredItems.length > 6;
    final isShowingAll = _isExpanded;

    if (!hasMoreItems) return SizedBox.shrink();

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isShowingAll
                  ? S.of(context).showLess
                  : S.of(context).showAllItems(_filteredItems.length),
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 8.w),
            Icon(
              isShowingAll
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: AppColors.primary,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveTable(List<InvoiceItem> items) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // تحديد ما إذا كان الشاشة صغيرة أم لا
        final isSmallScreen = constraints.maxWidth < 400;

        if (isSmallScreen) {
          // تصميم للشاشات الصغيرة - عمود واحد
          return _buildMobileLayout(items);
        } else {
          // تصميم للشاشات الكبيرة - جدول
          return _buildTableLayout(items);
        }
      },
    );
  }

  Widget _buildMobileLayout(List<InvoiceItem> items) {
    return Column(
      children: items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        return Column(
          children: [
            _buildMobileItemCard(item, index + 1),
            if (index < items.length - 1) SizedBox(height: 12.h),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildMobileItemCard(InvoiceItem item, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onItemTap != null ? () => widget.onItemTap!(item) : null,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.border.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with index and total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      '#$index',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
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
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // Item name
              Text(
                item.name ?? "Item Name",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),

              if (item.description?.isNotEmpty ?? false) ...[
                SizedBox(height: 4.h),
                Text(
                  item.description ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],

              SizedBox(height: 12.h),

              // Details row
              Row(
                children: [
                  Expanded(
                    child: _buildDetailItem(
                      S.of(context).qty,
                      item.quantity?.toString() ?? '0',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildDetailItem(
                      S.of(context).price,
                      NumberFormat.currency(
                        symbol:
                            context
                                    .read<LocalizationCubit>()
                                    .getCurrentLanguage() ==
                                'ar'
                            ? AppCurrency.currencyAr
                            : AppCurrency.currencyEn,
                      ).format(double.tryParse(item.price ?? '0.00') ?? 0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
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
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildTableLayout(List<InvoiceItem> items) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
            child: Row(
              children: [
                // DESCRIPTION Column
                Expanded(
                  flex: 4,
                  child: Text(
                    S.of(context).description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                // RATE Column
                Expanded(
                  flex: 2,
                  child: Text(
                    S.of(context).price,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // QTY Column
                Expanded(
                  flex: 1,
                  child: Text(
                    S.of(context).qty,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // SUBTOTAL Column
                Expanded(
                  flex: 2,
                  child: Text(
                    S.of(context).subtotal,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),

          // Table Rows
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            return _buildTableRow(item, index);
          }),
        ],
      ),
    );
  }

  Widget _buildTableRow(InvoiceItem item, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onItemTap != null ? () => widget.onItemTap!(item) : null,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.border.withOpacity(0.2),
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              // DESCRIPTION Column
              Expanded(
                flex: 4,
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
                        item.description ?? "",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              // RATE Column
              Expanded(
                flex: 2,
                child: Text(
                  NumberFormat.currency(
                    symbol:
                        context
                                .read<LocalizationCubit>()
                                .getCurrentLanguage() ==
                            'ar'
                        ? AppCurrency.currencyAr
                        : AppCurrency.currencyEn,
                  ).format(double.tryParse(item.price ?? '0.00') ?? 0),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // QTY Column
              Expanded(
                flex: 1,
                child: Text(
                  item.quantity?.toString() ?? '0',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // SUBTOTAL Column
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
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
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (widget.onItemTap != null) ...[
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 10.sp,
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
}
