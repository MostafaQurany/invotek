import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/category_name_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/category_description_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/icon_selection_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/color_selection_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/status_field.dart';
import 'package:invotek/features/expenses/ui/widgets/preview/category_preview_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/headers/add_category_header_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/sections/add_category_bottom_actions.dart';
import 'package:invotek/generated/l10n.dart';

class AddExpenseCategoryScreen extends StatefulWidget {
  const AddExpenseCategoryScreen({super.key});

  @override
  State<AddExpenseCategoryScreen> createState() =>
      _AddExpenseCategoryScreenState();
}

class _AddExpenseCategoryScreenState extends State<AddExpenseCategoryScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  // Form data
  String _selectedIcon = 'fas fa-money-bill';
  String _selectedColor = '#3B966E';
  String _selectedStatus = 'active';

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    final nameValid = _nameController.text.trim().isNotEmpty;
    return nameValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: BlocListener<ExpenseCategoriesCubit, ExpenseCategoriesState>(
        listener: (context, state) {
          state.whenOrNull(
            createSuccess:
                (
                  categories,
                  created,
                  selectedCategory,
                  currentPage,
                  totalPages,
                ) {
                  Navigator.pop(context);
                },
            failure:
                (categories, selectedCategory, currentPage, totalPages, error) {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text('Error: $error'),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      duration: Duration(milliseconds: 200),
                    ),
                  );
                },
          );
        },
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              // Header Section
              SliverToBoxAdapter(child: AddCategoryHeaderWidget()),

              // Form Content Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Add Category Details Section
                      Text(
                        S.of(context).addNewExpenseCategory,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Category Name Field
                      CategoryNameField(
                        controller: _nameController,
                        onChanged: (value) => setState(() {}),
                      ),

                      SizedBox(height: 20.h),

                      // Category Description Field
                      CategoryDescriptionField(
                        controller: _descriptionController,
                      ),

                      SizedBox(height: 20.h),

                      // Icon Selection Field
                      IconSelectionField(
                        selectedIcon: _selectedIcon,
                        onIconChanged: (icon) {
                          setState(() {
                            _selectedIcon = icon;
                          });
                        },
                      ),

                      SizedBox(height: 20.h),

                      // Color Selection Field
                      ColorSelectionField(
                        selectedColor: _selectedColor,
                        onColorChanged: (color) {
                          setState(() {
                            _selectedColor = color;
                          });
                        },
                      ),

                      SizedBox(height: 20.h),

                      // Status Field
                      StatusField(
                        selectedStatus: _selectedStatus,
                        onStatusChanged: (status) {
                          setState(() {
                            _selectedStatus = status;
                          });
                        },
                      ),

                      SizedBox(height: 24.h),

                      // Category Preview
                      Text(
                        '${S.of(context).categoryPreview}:',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      CategoryPreviewWidget(
                        name: _nameController.text.trim().isEmpty
                            ? S.of(context).categoryName
                            : _nameController.text.trim(),
                        description: _descriptionController.text.trim().isEmpty
                            ? S.of(context).categoryDescription
                            : _descriptionController.text.trim(),
                        icon: _selectedIcon,
                        color: _selectedColor,
                      ),

                      SizedBox(height: 100.h), // Space for bottom actions
                    ],
                  ),
                ),
              ),

              // Bottom Actions Section
              SliverToBoxAdapter(
                child: AddCategoryBottomActions(
                  onSaveCategory: _createCategory,
                  isFormValid: _isFormValid,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createCategory() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    categoriesCubit.createExpenseCategory(
      name: _nameController.text.trim(),
      status: _selectedStatus,
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      color: _selectedColor,
      icon: _selectedIcon,
    );
  }
}

class AddExpenseCategoryScreenWithProvider extends StatelessWidget {
  const AddExpenseCategoryScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddExpenseCategoryScreen();
  }
}
