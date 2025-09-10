import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class CategoryPreviewWidget extends StatelessWidget {
  final String name;
  final String description;
  final String icon;
  final String color;

  const CategoryPreviewWidget({
    super.key,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorValue = _parseColor(color);
    final iconData = _getIconData(icon);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: AppColors.textSecondary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 48.w,
            height: 48.w,
            decoration: BoxDecoration(
              color: colorValue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(iconData, color: colorValue, size: 24.sp),
          ),

          SizedBox(width: 12.w),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (description.isNotEmpty) ...[
                  SizedBox(height: 4.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
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
