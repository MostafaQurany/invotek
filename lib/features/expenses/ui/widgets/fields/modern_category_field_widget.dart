import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';
import 'package:invotek/generated/l10n.dart';

class ModernCategoryFieldWidget extends StatelessWidget {
  final ExpenseCategoryModel? selectedCategory;
  final Function(ExpenseCategoryModel?) onChanged;
  final bool required;

  const ModernCategoryFieldWidget({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: S.of(context).category,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              if (required)
                TextSpan(
                  text: ' *',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.error,
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        BlocBuilder<ExpenseCategoriesCubit, ExpenseCategoriesState>(
          builder: (context, state) {
            return state.when(
              initial:
                  (
                    categories,
                    selectedCategory,
                    currentPage,
                    totalPages,
                    error,
                  ) => _buildModernCategoryDropdown(categories),
              loading:
                  (
                    categories,
                    selectedCategory,
                    currentPage,
                    totalPages,
                    message,
                  ) =>
                      _buildModernCategoryDropdown(categories, isLoading: true),
              loaded: (categories, selectedCategory, currentPage, totalPages) =>
                  _buildModernCategoryDropdown(categories),
              createSuccess:
                  (
                    categories,
                    created,
                    selectedCategory,
                    currentPage,
                    totalPages,
                  ) => _buildModernCategoryDropdown(categories),
              updateSuccess:
                  (
                    categories,
                    updated,
                    selectedCategory,
                    currentPage,
                    totalPages,
                  ) => _buildModernCategoryDropdown(categories),
              deleteSuccess:
                  (
                    categories,
                    deletedId,
                    selectedCategory,
                    currentPage,
                    totalPages,
                  ) => _buildModernCategoryDropdown(categories),
              failure:
                  (
                    categories,
                    selectedCategory,
                    currentPage,
                    totalPages,
                    error,
                  ) => _buildModernCategoryDropdown(categories),
            );
          },
        ),
      ],
    );
  }

  Widget _buildModernCategoryDropdown(
    List<ExpenseCategoryModel> categories, {
    bool isLoading = false,
  }) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ExpenseCategoryModel>(
          value: selectedCategory,
          isExpanded: true,
          hint: Row(
            children: [
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: AppColors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.category_outlined,
                  color: AppColors.textSecondary,
                  size: 16.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                isLoading ? 'Loading categories...' : 'Select category',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xFF9CA3AF),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          selectedItemBuilder: (context) {
            return categories.map((category) {
              return Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: _parseColor(
                        category.color?.isNotEmpty == true
                            ? category.color!
                            : '#3B966E',
                      ).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
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
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              );
            }).toList();
          },
          items: categories.map((category) {
            return DropdownMenuItem<ExpenseCategoryModel>(
              value: category,
              child: Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: _parseColor(
                        category.color?.isNotEmpty == true
                            ? category.color!
                            : '#3B966E',
                      ).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6.r),
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
                      size: 16.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: isLoading ? null : onChanged,
          icon: Icon(
            Icons.arrow_drop_down,
            color: AppColors.textSecondary,
            size: 20.sp,
          ),
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
