import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/demo/cubit/categories_cubit.dart';

import '../../../../generated/l10n.dart';

class CategoriesListScreenWithProvider extends StatelessWidget {
  const CategoriesListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoriesListScreen();
  }
}

class CategoriesListScreen extends StatefulWidget {
  const CategoriesListScreen({super.key});

  @override
  State<CategoriesListScreen> createState() => _CategoriesListScreenState();
}

class _CategoriesListScreenState extends State<CategoriesListScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(S.of(context).productCategories),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 1,
        foregroundColor: colorScheme.onSurface,
        leading: IconButton(
          icon: Icon(Icons.menu, color: colorScheme.onSurface),
          onPressed: () {
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                zoomDrawer.toggle();
              } else {
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pushReplacementNamed('/home');
                }
              }
            } catch (e) {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            }
          },
        ),
        actionsPadding: EdgeInsetsDirectional.only(end: 16.w),
        actions: [
          IconButton.filled(
            style: IconButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            icon: Icon(Icons.add, size: 18.sp),
            onPressed: () {
              _showAddCategoryDialog(context, context.read<CategoriesCubit>());
            },
          ),
        ],
      ),
      body: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          final messenger = ScaffoldMessenger.of(context);
          state.maybeWhen(
            failure: (categories, currentPage, totalPages, error) {
              messenger.hideCurrentSnackBar();
              messenger.showSnackBar(
                SnackBar(
                  content: Text(error),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
              context.read<CategoriesCubit>().clearError();
            },
            createSuccess: (categories, created, currentPage, totalPages) {
              messenger.hideCurrentSnackBar();
              messenger.showSnackBar(
                SnackBar(
                  content: Text(S.of(context).categoryAddedSuccessfully),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
            },
            updateSuccess: (categories, updated, currentPage, totalPages) {
              messenger.hideCurrentSnackBar();
              messenger.showSnackBar(
                SnackBar(
                  content: Text(S.of(context).categoryUpdatedSuccessfully),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
            },
            deleteSuccess: (categories, deletedId, currentPage, totalPages) {
              messenger.hideCurrentSnackBar();
              messenger.showSnackBar(
                SnackBar(
                  content: Text(S.of(context).categoryDeletedSuccessfully),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: (categories, currentPage, totalPages, error) =>
                _buildContent(context, categories, false),
            loading: (categories, currentPage, totalPages, message) =>
                _buildContent(context, categories, true),
            loaded: (categories, currentPage, totalPages) =>
                _buildContent(context, categories, false),
            createSuccess: (categories, created, currentPage, totalPages) =>
                _buildContent(context, categories, false),
            updateSuccess: (categories, updated, currentPage, totalPages) =>
                _buildContent(context, categories, false),
            deleteSuccess: (categories, deletedId, currentPage, totalPages) =>
                _buildContent(context, categories, false),
            failure: (categories, currentPage, totalPages, error) =>
                _buildContent(context, categories, false),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () =>
      //       _showAddCategoryDialog(context, context.read<CategoriesCubit>()),
      //   icon: const Icon(Icons.add),
      //   label: Text(S.of(context).addCategory),
      // ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<ProductCategoryApiModel> categories,
    bool isLoading,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(color: colorScheme.primary),
      );
    }

    if (categories.isEmpty) {
      return _buildEmptyState(colorScheme);
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CategoriesCubit>().loadFirstPage(refresh: true);
      },
      child: ListView.builder(
        padding: EdgeInsets.all(16.w),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(category, colorScheme, context);
        },
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 64.sp,
            color: colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 16.h),
          Text(
            'No categories found',
            style: TextStyle(fontSize: 16, color: colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    ProductCategoryApiModel category,
    ColorScheme colorScheme,
    BuildContext context,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: colorScheme.outline.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        leading: Container(
          width: 48.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            Icons.category,
            color: colorScheme.onPrimaryContainer,
            size: 24.sp,
          ),
        ),
        title: Text(
          category.name,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: category.description != null
            ? Text(
                category.description!,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: colorScheme.onSurfaceVariant,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        trailing: PopupMenuButton<String>(
          icon: Icon(Icons.more_vert, color: colorScheme.onSurfaceVariant),
          onSelected: (value) {
            switch (value) {
              case 'edit':
                _showEditCategoryDialog(
                  context,
                  category,
                  context.read<CategoriesCubit>(),
                );
                break;
              case 'delete':
                _showDeleteConfirmation(context, category);
                break;
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit, size: 18.sp, color: AppColors.secondary),
                  SizedBox(width: 8.w),
                  Text(S.of(context).editCategory),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, size: 18.sp, color: AppColors.error),
                  SizedBox(width: 8.w),
                  Text('Delete Category'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddCategoryDialog(BuildContext context, CategoriesCubit cubit) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(S.of(context).addCategory),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: '${S.of(context).name} *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: S.of(context).description,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton(
            onPressed: () {
              if (nameController.text.trim().isNotEmpty) {
                cubit.createCategory(nameController.text.trim());
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditCategoryDialog(
    BuildContext context,
    ProductCategoryApiModel category,
    CategoriesCubit cubit,
  ) {
    final nameController = TextEditingController(text: category.name);
    final descriptionController = TextEditingController(
      text: category.description ?? '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(S.of(context).editCategory),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: '${S.of(context).name} *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: S.of(context).description,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainer,
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton(
            onPressed: () {
              if (nameController.text.trim().isNotEmpty) {
                context.read<CategoriesCubit>().updateCategory(
                  category.id,
                  nameController.text.trim(),
                );
                Navigator.pop(context);
              }
            },
            child: Text('Update'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    ProductCategoryApiModel category,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(S.of(context).deleteConfirmation),
        content: Text('Are you sure you want to delete "${category.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton.tonal(
            onPressed: () {
              context.read<CategoriesCubit>().deleteCategory(category.id);
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.error.withValues(alpha: 0.1),
              foregroundColor: AppColors.error,
            ),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }
}
