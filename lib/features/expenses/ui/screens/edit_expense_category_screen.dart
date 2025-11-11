import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/category_name_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/category_description_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/icon_selection_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/color_selection_field.dart';
import 'package:invotek/features/expenses/ui/widgets/fields/status_field.dart';
import 'package:invotek/features/expenses/ui/widgets/headers/edit_exoense_category_header_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/preview/category_preview_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/sections/add_category_bottom_actions.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/expenses/constants/expenses_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class EditExpenseCategoryScreen extends StatefulWidget {
  final ExpenseCategoryModel category;

  const EditExpenseCategoryScreen({super.key, required this.category});

  @override
  State<EditExpenseCategoryScreen> createState() =>
      _EditExpenseCategoryScreenState();
}

class _EditExpenseCategoryScreenState extends State<EditExpenseCategoryScreen> {
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
    _populateFormData();
  }

  void _initializeControllers() {
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  void _populateFormData() {
    final category = widget.category;

    _nameController.text = category.name;
    _descriptionController.text = category.description ?? '';
    _selectedIcon = category.icon ?? 'fas fa-money-bill';
    _selectedColor = category.color ?? '#3B966E';
    _selectedStatus = category.status;
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
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      ExpenseCategoriesPermissions.edit,
    );

    if (!hasEditPermission) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 64.sp,
                    color: colorScheme.error,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    s.expensesNoPermissionToView,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    s.expensesNoPermissionToAct,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: BlocListener<ExpenseCategoriesCubit, ExpenseCategoriesState>(
        listener: (context, state) {
          state.whenOrNull(
            updateSuccess:
                (
                  categories,
                  updated,
                  selectedCategory,
                  currentPage,
                  totalPages,
                ) async {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  await messenger
                      .showSnackBar(
                        SnackBar(
                          content: Text(
                            S.of(context).categoryUpdatedSuccessfully,
                          ),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          duration: Duration(milliseconds: 200),
                        ),
                      )
                      .closed;
                  Navigator.pop(context);
                },
            failure:
                (categories, selectedCategory, currentPage, totalPages, error) {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text(s.expensesErrorOccurred(error.toString())),
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
              SliverToBoxAdapter(child: EditExpenseCategoryHeaderWidget()),

              // Form Content Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Edit Category Details Section
                      Text(
                        S.of(context).editExpenseCategory,
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
                  onSaveCategory: _updateCategory,
                  isFormValid: _isFormValid,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateCategory() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    categoriesCubit.updateExpenseCategory(
      id: widget.category.id,
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

class EditExpenseCategoryScreenWithProvider extends StatelessWidget {
  final ExpenseCategoryModel category;

  const EditExpenseCategoryScreenWithProvider({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return EditExpenseCategoryScreen(category: category);
  }
}
