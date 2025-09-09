import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class ProductsEmptyState extends StatelessWidget {
  final ColorScheme colorScheme;

  const ProductsEmptyState({super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64.sp,
            color: colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 16.h),
          Text(
            S.current.noProductsFound,
            style: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
