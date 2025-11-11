import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/expenses/constants/expenses_permissions.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/screens/add_expense_category_screen.dart';
import 'package:invotek/features/expenses/ui/screens/edit_expense_category_screen.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class ExpenseCategoriesListScreen extends StatefulWidget {
  const ExpenseCategoriesListScreen({super.key});

  @override
  State<ExpenseCategoriesListScreen> createState() =>
      _ExpenseCategoriesListScreenState();
}

class _ExpenseCategoriesListScreenState
    extends State<ExpenseCategoriesListScreen> {
  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).unfocus();
  }

  void _loadCategories() {
    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    categoriesCubit.loadFirstPage(refresh: true);
  }

  void _navigateToAddCategory() {
    PermissionChecker.hasPermission(
          context,
          ExpenseCategoriesPermissions.create,
        )
        ? () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddExpenseCategoryScreen(),
              ),
            );
          }
        : null;
  }

  void _navigateToEditCategory(ExpenseCategoryModel category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditExpenseCategoryScreenWithProvider(category: category),
        settings: const RouteSettings(name: AppRoutes.editExpenseCategoryRoute),
      ),
    );
  }

  void _showDeleteConfirmation(ExpenseCategoryModel category) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).deleteCategory),
        content: Text(S.of(context).deleteCategoryConfirmation(category.name)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              final categoriesCubit = ExpenseCategoriesCubit.get(context);
              categoriesCubit.deleteExpenseCategory(category.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.white,
            ),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final canPop = Navigator.of(context).canPop();
          if (canPop) {
            // السماح بالرجوع العادي بدون dialog
            Navigator.of(context).pop();
          } else {
            // فتح zoomDrawer والانتقال إلى home
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                // إغلاق zoomDrawer إذا كان مفتوحاً
                if (zoomDrawer.isOpen()) {
                  zoomDrawer.close();
                }
                // الانتقال إلى home باستخدام NavigationCubit
                context.read<NavigationCubit>().navigateToRoute(AppRoutes.homeRoute);
              } else {
                // Fallback: الانتقال إلى home مباشرة
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              }
            } catch (e) {
              // Fallback: الانتقال إلى home مباشرة
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
        elevation: 1,
        scrolledUnderElevation: 1,
        backgroundColor: AppColors.backgroundLight,
        title: Text(
          S.of(context).expenseCategories,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        leading: IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          onPressed: _navigateToAddCategory,
          icon: Icon(Icons.add, color: AppColors.white, size: 18.sp),
        ),
        actionsPadding: EdgeInsetsDirectional.only(end: 16.w),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 3.w),
            child: IconButton(
              onPressed: () {
                ZoomDrawer.of(context)?.toggle();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: AppColors.primary,
                size: 24.sp,
              ),
              padding: EdgeInsets.all(8.w),
            ),
          ),
        ],
      ),
      body: BlocListener<ExpenseCategoriesCubit, ExpenseCategoriesState>(
        listener: (context, state) {
          state.whenOrNull(
            deleteSuccess:
                (
                  categories,
                  deletedId,
                  selectedCategory,
                  currentPage,
                  totalPages,
                ) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).categoryDeletedSuccessfully),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                },
            failure:
                (categories, selectedCategory, currentPage, totalPages, error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).errorMessage(error)),
                      backgroundColor: AppColors.error,
                    ),
                  );
                },
          );
        },
        child: BlocBuilder<ExpenseCategoriesCubit, ExpenseCategoriesState>(
          builder: (context, state) {
            return state.when(
              initial:
                  (
                    categories,
                    selectedCategory,
                    currentPage,
                    totalPages,
                    error,
                  ) => _buildEmptyState(),
              loading:
                  (
                    categories,
                    selectedCategory,
                    currentPage,
                    totalPages,
                    message,
                  ) => _buildLoadingState(),
              loaded: (categories, selectedCategory, currentPage, totalPages) =>
                  _buildCategoriesList(categories),
              createSuccess:
                  (
                    categories,
                    created,
                    selectedCategory,
                    currentPage,
                    totalPages,
                  ) => _buildCategoriesList(categories),
              updateSuccess:
                  (
                    categories,
                    updated,
                    selectedCategory,
                    currentPage,
                    totalPages,
                  ) => _buildCategoriesList(categories),
              deleteSuccess:
                  (
                    categories,
                    deletedId,
                    selectedCategory,
                    currentPage,
                    totalPages,
                  ) => _buildCategoriesList(categories),
              failure:
                  (
                    categories,
                    selectedCategory,
                    currentPage,
                    totalPages,
                    error,
                  ) => _buildErrorState(error),
            );
          },
        ),
      ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return Center(child: CircularProgressIndicator(color: AppColors.primary));
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 80.sp,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: 16.h),
          Text(
            S.of(context).noCategoriesFound,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).createYourFirstExpenseCategory,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: _navigateToAddCategory,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            ),
            child: Text(S.of(context).addCategory),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 80.sp, color: AppColors.error),
          SizedBox(height: 16.h),
          Text(
            S.of(context).errorLoadingCategories,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            error,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: _loadCategories,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
            ),
            child: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesList(List<ExpenseCategoryModel> categories) {
    if (categories.isEmpty) {
      return _buildEmptyState();
    }

    return RefreshIndicator(
      onRefresh: () async {
        _loadCategories();
      },
      child: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
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
            child: ListTile(
              contentPadding: EdgeInsets.all(16.w),
              leading: Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.category,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
              title: Text(
                category.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              subtitle: Text(
                S.of(context).statusCategory(category.status),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              trailing: Builder(
                builder: (context) {
                  final s = S.of(context);
                  final hasEditPermission = PermissionChecker.hasPermission(
                    context,
                    ExpenseCategoriesPermissions.edit,
                  );
                  final hasDeletePermission = PermissionChecker.hasPermission(
                    context,
                    ExpenseCategoriesPermissions.delete,
                  );

                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Tooltip(
                        message: hasEditPermission
                            ? ''
                            : s.expensesNoPermissionToAct,
                        child: IconButton(
                          onPressed: hasEditPermission
                              ? () => _navigateToEditCategory(category)
                              : null,
                          icon: Icon(
                            hasEditPermission ? Icons.edit : Icons.lock_outline,
                          ),
                          color: hasEditPermission
                              ? AppColors.primary
                              : AppColors.primary.withOpacity(0.5),
                        ),
                      ),
                      Tooltip(
                        message: hasDeletePermission
                            ? ''
                            : s.expensesNoPermissionToAct,
                        child: IconButton(
                          onPressed: hasDeletePermission
                              ? () => _showDeleteConfirmation(category)
                              : null,
                          icon: Icon(
                            hasDeletePermission
                                ? Icons.delete
                                : Icons.lock_outline,
                          ),
                          color: hasDeletePermission
                              ? AppColors.error
                              : AppColors.error.withOpacity(0.5),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExpenseCategoriesListScreenWithProvider extends StatelessWidget {
  const ExpenseCategoriesListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpenseCategoriesListScreen();
  }
}
