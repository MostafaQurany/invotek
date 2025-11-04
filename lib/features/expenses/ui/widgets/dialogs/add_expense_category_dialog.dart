import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class AddExpenseCategoryDialog extends StatefulWidget {
  const AddExpenseCategoryDialog({super.key});

  @override
  State<AddExpenseCategoryDialog> createState() =>
      _AddExpenseCategoryDialogState();
}

class _AddExpenseCategoryDialogState extends State<AddExpenseCategoryDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedStatus = 'active';
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _nameController.text.trim().isNotEmpty && !_isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpenseCategoriesCubit, ExpenseCategoriesState>(
      listener: (context, state) {
        state.whenOrNull(
          loading:
              (categories, selectedCategory, currentPage, totalPages, message) {
                if (message == 'creating') {
                  setState(() {
                    _isLoading = true;
                  });
                }
              },
          createSuccess:
              (categories, created, selectedCategory, currentPage, totalPages) {
                setState(() {
                  _isLoading = false;
                });
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).categoryCreatedSuccessfully),
                    backgroundColor: AppColors.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                );
              },
          failure:
              (categories, selectedCategory, currentPage, totalPages, error) {
                setState(() {
                  _isLoading = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: $error'),
                    backgroundColor: AppColors.error,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                );
              },
        );
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          width: double.maxFinite,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: AppColors.primary,
                          size: 24.sp,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            S.of(context).addNewExpenseCategory,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: _isLoading
                              ? null
                              : () => Navigator.pop(context),
                          icon: Icon(
                            Icons.close,
                            color: AppColors.textSecondary,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // Category Name Field
                    Text(
                      '${S.of(context).categoryName} *',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: _nameController,
                      enabled: !_isLoading,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterCategoryName,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppColors.textSecondary.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppColors.textSecondary.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(
                            color: AppColors.primary,
                            width: 2,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return S.of(context).categoryNameRequired;
                        }
                        return null;
                      },
                      onChanged: (value) => setState(() {}),
                    ),

                    SizedBox(height: 20.h),

                    // Status Field
                    Text(
                      S.of(context).status,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.textSecondary.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedStatus,
                          isExpanded: true,
                          disabledHint: Text(
                            S.of(context).active,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: 'active',
                              child: Text(
                                S.of(context).active,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'inactive',
                              child: Text(
                                S.of(context).inactive,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                          onChanged: _isLoading
                              ? null
                              : (value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedStatus = value;
                                    });
                                  }
                                },
                        ),
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // Action Buttons
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: _isLoading
                                ? null
                                : () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              side: BorderSide(
                                color: AppColors.textSecondary.withOpacity(0.3),
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: Text(
                              S.of(context).cancel,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textSecondary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isFormValid ? _saveCategory : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              elevation: 0,
                            ),
                            child: _isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 16.w,
                                        height: 16.h,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                AppColors.white,
                                              ),
                                        ),
                                      ),
                                      SizedBox(width: 8.w),
                                      Text(
                                        S.of(context).saving,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    S.of(context).saveCategory,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _saveCategory() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    categoriesCubit.createExpenseCategory(
      name: _nameController.text.trim(),
      status: _selectedStatus,
    );
  }
}
