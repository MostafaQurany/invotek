import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class IconSelectionField extends StatelessWidget {
  final String selectedIcon;
  final ValueChanged<String> onIconChanged;

  const IconSelectionField({
    super.key,
    required this.selectedIcon,
    required this.onIconChanged,
  });

  static const List<String> _icons = [
    'fas fa-credit-card',
    'fas fa-tag',
    'fas fa-dollar-sign',
    'fas fa-receipt',
    'fas fa-file-alt',
    'fas fa-shopping-cart',
    'fas fa-wallet',
    'fas fa-university',
    'fas fa-building',
    'fas fa-plane',
    'fas fa-book',
    'fas fa-graduation-cap',
    'fas fa-home',
    'fas fa-car',
    'fas fa-gas-pump',
    'fas fa-coffee',
    'fas fa-utensils',
    'fas fa-tshirt',
    'fas fa-gift',
    'fas fa-eye',
    'fas fa-medkit',
    'fas fa-heart',
    'fas fa-briefcase',
    'fas fa-money-bill',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with required asterisk
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: S.of(context).icon,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        // Selected Icon Display
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.textSecondary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Text(
            selectedIcon,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
              fontFamily: 'monospace',
            ),
          ),
        ),

        SizedBox(height: 12.h),

        // Icon Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 1,
          ),
          itemCount: _icons.length,
          itemBuilder: (context, index) {
            final icon = _icons[index];
            final isSelected = icon == selectedIcon;

            return GestureDetector(
              onTap: () => onIconChanged(icon),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Icon(
                    _getIconData(icon),
                    size: 20.sp,
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
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
