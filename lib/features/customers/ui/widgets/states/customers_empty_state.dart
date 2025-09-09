import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class CustomersEmptyState extends StatelessWidget {
  final VoidCallback onAddCustomer;

  const CustomersEmptyState({
    super.key,
    required this.onAddCustomer,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 80.sp,
            color: colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 16.h),
          Text(
            s.noCustomersFound,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            s.noCustomersFoundMessage,
            style: TextStyle(
              fontSize: 14.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 24.h),
          FilledButton.icon(
            onPressed: onAddCustomer,
            icon: Icon(Icons.add),
            label: Text(s.addNewCustomer),
          ),
        ],
      ),
    );
  }
}
