import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class InvoicesFiltersResult {
  final String status; // all | pending | sent
  final String sortOrder; // asc | desc

  const InvoicesFiltersResult({required this.status, required this.sortOrder});
}

class InvoicesFiltersBottomSheet extends StatefulWidget {
  final String initialStatus; // all | pending | sent
  final String initialSortOrder; // asc | desc

  const InvoicesFiltersBottomSheet({
    super.key,
    required this.initialStatus,
    required this.initialSortOrder,
  });

  @override
  State<InvoicesFiltersBottomSheet> createState() =>
      _InvoicesFiltersBottomSheetState();
}

class _InvoicesFiltersBottomSheetState
    extends State<InvoicesFiltersBottomSheet> {
  late String _status;
  late String _sortOrder;

  @override
  void initState() {
    super.initState();
    _status = widget.initialStatus;
    _sortOrder = widget.initialSortOrder;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).invoicesFilterInvoices,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            _buildSectionTitle(S.of(context).invoicesStatus),
            _buildStatusChips(),
            SizedBox(height: 12.h),
            _buildSectionTitle(S.of(context).invoicesSortOrder),
            _buildSortOrderChips(),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(S.of(context).cancel),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        InvoicesFiltersResult(
                          status: _status,
                          sortOrder: _sortOrder,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(S.of(context).invoicesApply),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
      ),
    );
  }

  Widget _buildStatusChips() {
    final s = S.of(context);
    final options = [
      ['all', s.invoicesAll],
      ['pending', s.invoicesPending],
      ['sent', s.invoicesSent],
    ];
    return Wrap(
      spacing: 8.w,
      children: options
          .map(
            (o) => ChoiceChip(
              label: Text(o[1]),
              selected: _status == o[0],
              onSelected: (_) => setState(() => _status = o[0]),
            ),
          )
          .toList(),
    );
  }

  Widget _buildSortOrderChips() {
    final s = S.of(context);
    final options = [
      ['desc', s.invoicesDescending],
      ['asc', s.invoicesAscending],
    ];
    return Wrap(
      spacing: 8.w,
      children: options
          .map(
            (o) => ChoiceChip(
              label: Text(o[1]),
              selected: _sortOrder == o[0],
              onSelected: (_) => setState(() => _sortOrder = o[0]),
            ),
          )
          .toList(),
    );
  }
}
