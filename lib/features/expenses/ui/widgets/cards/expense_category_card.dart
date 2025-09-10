import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/entit/expense_category_model.dart';

class ExpenseCategoryCard extends StatelessWidget {
  final ExpenseCategoryModel category;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onView;
  final ColorScheme colorScheme;

  const ExpenseCategoryCard({
    super.key,
    required this.category,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
    required this.onView,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Category Icon
            Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                color: _parseColor(
                  category.color?.isNotEmpty == true
                      ? category.color!
                      : '#3B966E',
                ).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                _getIconData(
                  category.icon?.isNotEmpty == true
                      ? category.icon!
                      : 'fas fa-money-bill',
                ),
                color: _parseColor(
                  category.color?.isNotEmpty == true
                      ? category.color!
                      : '#3B966E',
                ),
                size: 24.sp,
              ),
            ),

            SizedBox(width: 16.w),

            // Category Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (category.description != null &&
                      category.description!.isNotEmpty) ...[
                    SizedBox(height: 4.h),
                    Text(
                      category.description!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  SizedBox(height: 4.h),
                  Text(
                    'Created: ${category.createdAtString}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            // Status Chip
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: category.status == 'active'
                    ? AppColors.success.withOpacity(0.1)
                    : AppColors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                category.status.toUpperCase(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: category.status == 'active'
                      ? AppColors.success
                      : AppColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return AppColors.primary;
    }
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'fas fa-credit-card':
        return Icons.credit_card;
      case 'fas fa-tag':
        return Icons.tag;
      case 'fas fa-dollar-sign':
        return Icons.attach_money;
      case 'fas fa-receipt':
        return Icons.receipt;
      case 'fas fa-file-alt':
        return Icons.description;
      case 'fas fa-shopping-cart':
        return Icons.shopping_cart;
      case 'fas fa-wallet':
        return Icons.account_balance_wallet;
      case 'fas fa-university':
        return Icons.account_balance;
      case 'fas fa-building':
        return Icons.business;
      case 'fas fa-plane':
        return Icons.flight;
      case 'fas fa-book':
        return Icons.book;
      case 'fas fa-graduation-cap':
        return Icons.school;
      case 'fas fa-home':
        return Icons.home;
      case 'fas fa-car':
        return Icons.directions_car;
      case 'fas fa-gas-pump':
        return Icons.local_gas_station;
      case 'fas fa-coffee':
        return Icons.local_cafe;
      case 'fas fa-utensils':
        return Icons.restaurant;
      case 'fas fa-tshirt':
        return Icons.checkroom;
      case 'fas fa-gift':
        return Icons.card_giftcard;
      case 'fas fa-eye':
        return Icons.visibility;
      case 'fas fa-medkit':
        return Icons.medical_services;
      case 'fas fa-heart':
        return Icons.favorite;
      case 'fas fa-briefcase':
        return Icons.work;
      case 'fas fa-money-bill':
        return Icons.money;
      default:
        return Icons.help_outline;
    }
  }
}
