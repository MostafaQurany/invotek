import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/features/products/ui/widgets/cards/animated_card.dart';

class ProductInsightsCard extends StatelessWidget {
  final ProductModel product;

  const ProductInsightsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      delay: Duration(milliseconds: 600),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                'Product Insights',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.receipt_long,
                  label: 'Invoices',
                  value: '8',
                  subtitle: 'This Month',
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.people_outline,
                  label: 'Customers',
                  value: '12',
                  subtitle: 'Bought This',
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              Expanded(
                child: _buildStatItem(
                  icon: Icons.trending_up,
                  label: 'Sales',
                  value: 'SAR 8,420',
                  subtitle: 'This Month',
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: _buildStatItem(
                  icon: Icons.inventory_2,
                  label: 'Stock',
                  value: '${product.quantity ?? 0}',
                  subtitle: 'Available',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greyDark,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            subtitle,
            style: TextStyle(fontSize: 10.sp, color: AppColors.greyDark),
          ),
        ],
      ),
    );
  }
}
