import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/core/widgets/common_menu_button.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/products/constants/products_permissions.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/domain/cubit/categories_cubit.dart';

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
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingNextPage = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoriesCubit>().loadFirstPage(refresh: true);
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final pixels = position.pixels;
    final maxScrollExtent = position.maxScrollExtent;

    // Check if we're near the bottom (within 400 pixels)
    if (maxScrollExtent > 0 && pixels >= maxScrollExtent - 400) {
      if (!_isLoadingNextPage && mounted) {
        final cubit = context.read<CategoriesCubit>();

        // Check if loading or has more pages
        if (!cubit.isLoadingPage && cubit.hasMore) {
          _isLoadingNextPage = true;
          cubit
              .loadNextPage()
              .then((_) {
                if (mounted) {
                  _isLoadingNextPage = false;
                }
              })
              .catchError((error) {
                if (mounted) {
                  _isLoadingNextPage = false;
                }
              });
        }
      }
    }
  }

  Timer? _debounceTimer;

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      context.read<CategoriesCubit>().loadFirstPage(
        refresh: true,
        search: query.isEmpty ? null : query,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    // Check permission for viewing categories
    if (!PermissionChecker.hasPermission(
      context,
      ProductsPermissions.categoryView,
    )) {
      return Scaffold(
        appBar: AppBar(
          title: Text(s.productCategories),
          backgroundColor: AppColors.backgroundLight,
          elevation: 1,
          foregroundColor: AppColors.primary,
          actions: [CommonMenuButton(color: AppColors.primary)],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 64.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              Text(
                s.productsNoPermissionToView,
                style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                s.productsNoPermissionToAct,
                style: TextStyle(fontSize: 14.sp, color: AppColors.greyDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

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
        title: Text(S.of(context).productCategories),
        backgroundColor: AppColors.backgroundLight,
        elevation: 1,
        scrolledUnderElevation: 1,
        foregroundColor: AppColors.primary,
        leading: IconButton.filled(
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          icon: Icon(Icons.add, size: 18.sp),
          onPressed:
              PermissionChecker.hasPermission(
                context,
                ProductsPermissions.categoryCreate,
              )
              ? () {
                  _showAddCategoryDialog(
                    context,
                    context.read<CategoriesCubit>(),
                  );
                }
              : null,
        ),
        actionsPadding: EdgeInsetsDirectional.only(end: 16.w),
        actions: [CommonMenuButton(color: AppColors.primary)],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 0),
            child: CommonSearchBar(
              controller: _searchController,
              hintText: S.of(context).search,
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: BlocConsumer<CategoriesCubit, CategoriesState>(
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
                  createSuccess:
                      (categories, created, currentPage, totalPages) {
                        messenger.hideCurrentSnackBar();
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              S.of(context).categoryAddedSuccessfully,
                            ),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        );
                      },
                  updateSuccess:
                      (categories, updated, currentPage, totalPages) {
                        messenger.hideCurrentSnackBar();
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              S.of(context).categoryUpdatedSuccessfully,
                            ),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                        );
                      },
                  deleteSuccess:
                      (categories, deletedId, currentPage, totalPages) {
                        messenger.hideCurrentSnackBar();
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                              S.of(context).categoryDeletedSuccessfully,
                            ),
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
                      _buildContent(context, categories, false, null),
                  loading: (categories, currentPage, totalPages, message) =>
                      _buildContent(context, categories, true, message),
                  loaded: (categories, currentPage, totalPages) =>
                      _buildContent(context, categories, false, null),
                  createSuccess:
                      (categories, created, currentPage, totalPages) =>
                          _buildContent(context, categories, false, null),
                  updateSuccess:
                      (categories, updated, currentPage, totalPages) =>
                          _buildContent(context, categories, false, null),
                  deleteSuccess:
                      (categories, deletedId, currentPage, totalPages) =>
                          _buildContent(context, categories, false, null),
                  failure: (categories, currentPage, totalPages, error) =>
                      _buildContent(context, categories, false, null),
                );
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () =>
      //       _showAddCategoryDialog(context, context.read<CategoriesCubit>()),
      //   icon: const Icon(Icons.add),
      //   label: Text(S.of(context).addCategory),
      // ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    List<ProductCategoryApiModel> categories,
    bool isLoading,
    String? loadingMessage,
  ) {
    final colorScheme = Theme.of(context).colorScheme;

    // Show full screen loader only when refreshing (first load)
    if (isLoading && categories.isEmpty) {
      return Center(
        child: CircularProgressIndicator(color: colorScheme.primary),
      );
    }

    if (categories.isEmpty && !isLoading) {
      return _buildEmptyState(colorScheme);
    }

    // Check if loading more (pagination)
    final bool isLoadingMore = loadingMessage == 'loading_more';

    return RefreshIndicator(
      onRefresh: () async {
        context.read<CategoriesCubit>().loadFirstPage(refresh: true);
      },
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(16.w),
        itemCount: categories.length + (isLoadingMore ? 1 : 0),
        itemBuilder: (context, index) {
          // Show loading indicator at the end when loading more
          if (index == categories.length && isLoadingMore) {
            return Container(
              padding: EdgeInsets.all(16.w),
              child: Center(
                child: CircularProgressIndicator(color: colorScheme.primary),
              ),
            );
          }

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
            S.of(context).productsNoCategoriesFound,
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
                  Text(S.of(context).productsDeleteCategory),
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
    final statues = TextEditingController(text: "active");
    bool isActive = true;
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocalState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            title: Text(S.of(context).addCategory),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchListTile(
                  title: Text(S.of(context).productsCategoryState),
                  subtitle: Text(
                    S.of(context).productsCheckIfCategoryIsActiveOrInactive,
                  ),
                  value: isActive,
                  onChanged: (value) {
                    setLocalState(() {
                      isActive = value;
                      statues.text = isActive ? "active" : "inactive";
                    });
                  },
                  activeThumbColor: AppColors.primary,
                ),
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
                    cubit.createCategory(
                      nameController.text.trim(),
                      status: statues.text,
                      description: descriptionController.text.trim().isEmpty
                          ? null
                          : descriptionController.text.trim(),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text(S.of(context).productsAdd),
              ),
            ],
          );
        },
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
    final statues = TextEditingController(text: category.status ?? 'active');
    bool isActive = (statues.text == 'active');

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocalState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            title: Text(S.of(context).editCategory),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchListTile(
                  title: Text(S.of(context).productsCategoryState),
                  subtitle: Text(
                    S.of(context).productsCheckIfCategoryIsActiveOrInactive,
                  ),
                  value: isActive,
                  onChanged: (value) {
                    setLocalState(() {
                      isActive = value;
                      statues.text = isActive ? 'active' : 'inactive';
                    });
                  },
                  activeThumbColor: AppColors.primary,
                ),
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
                      status: statues.text,
                      description: descriptionController.text.trim().isEmpty
                          ? null
                          : descriptionController.text.trim(),
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text(S.of(context).productsUpdate),
              ),
            ],
          );
        },
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
        content: Text(
          S.of(context).productsDeleteCategoryConfirmation(category.name),
        ),
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
