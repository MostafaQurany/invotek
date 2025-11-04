import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';

class DeleteAllCategoriesScreen extends StatefulWidget {
  const DeleteAllCategoriesScreen({super.key});

  @override
  State<DeleteAllCategoriesScreen> createState() =>
      _DeleteAllCategoriesScreenState();
}

class _DeleteAllCategoriesScreenState extends State<DeleteAllCategoriesScreen> {
  bool _isDeleting = false;
  List<ExpenseCategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() {
    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    setState(() {
      _categories = categoriesCubit.categories;
    });
  }

  Future<void> _deleteAllCategories() async {
    if (_categories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No categories to delete'),
          backgroundColor: AppColors.primary,
        ),
      );
      return;
    }

    setState(() {
      _isDeleting = true;
    });

    final categoriesCubit = ExpenseCategoriesCubit.get(context);

    // Delete each category one by one
    for (final category in _categories) {
      try {
        await categoriesCubit.deleteExpenseCategory(category.id);
        // Wait a bit between deletions to avoid overwhelming the API
        await Future.delayed(Duration(milliseconds: 500));
      } catch (e) {
        print('Error deleting category ${category.id}: $e');
      }
    }

    setState(() {
      _isDeleting = false;
      _categories = [];
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('All categories deleted successfully'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete All Categories'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Categories (${_categories.length})',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 16.h),

            if (_categories.isEmpty)
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.textSecondary.withOpacity(0.2),
                  ),
                ),
                child: Text(
                  'No categories found. You can now start creating new ones!',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.textSecondary.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.w,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: Icon(
                              Icons.category,
                              color: AppColors.primary,
                              size: 16.sp,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category.name,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  'Status: ${category.status}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            SizedBox(height: 24.h),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _categories.isEmpty || _isDeleting
                    ? null
                    : _deleteAllCategories,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: _isDeleting
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Deleting...',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ],
                      )
                    : Text(
                        'Delete All Categories (${_categories.length})',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),

            SizedBox(height: 12.h),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteAllCategoriesScreenWithProvider extends StatelessWidget {
  const DeleteAllCategoriesScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const DeleteAllCategoriesScreen();
  }
}
