import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/expenses/constants/expenses_permissions.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';
import 'package:invotek/features/expenses/ui/screens/add_expense_screen.dart';
import 'package:invotek/features/expenses/ui/screens/edit_expense_screen.dart';
import 'package:invotek/features/expenses/ui/screens/expense_details_screen.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expense_options_bottom_sheet.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expenses_header_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/dialogs/delete_expense_dialog.dart';
import 'package:invotek/features/expenses/ui/widgets/lists/expenses_state_builder.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class ExpensesListScreenWithProvider extends StatelessWidget {
  const ExpensesListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpensesListScreen();
  }
}

class _ExpensesListScreenState extends State<ExpensesListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  String? _selectedStatus;
  String? _selectedCategory;
  String _selectedSortBy = 'created_at';
  String _selectedSortOrder = 'desc';
  bool _isLoadingNextPage = false;
  bool _isNavigating = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
    _setupScrollListener();
    ExpensesCubit.get(context).loadFirstPage();
    ExpenseCategoriesCubit.get(context).loadFirstPage();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (!_scrollController.hasClients) return;

      final position = _scrollController.position;
      final pixels = position.pixels;
      final maxScrollExtent = position.maxScrollExtent;

      if (maxScrollExtent > 0 && pixels >= maxScrollExtent - 400) {
        if (!_isLoadingNextPage && mounted) {
          final cubit = ExpensesCubit.get(context);
          if (!cubit.isLoadingPage) {
            final currentPage = cubit.currentPage;
            final totalPages = cubit.totalPages;
            if (currentPage < totalPages) {
              _isLoadingNextPage = true;
              cubit.loadNextPage().whenComplete(() {
                if (mounted) _isLoadingNextPage = false;
              });
            }
          }
        }
      }
    });
  }

  void _initializeOptions() {
    _selectedStatus = 'all_status';
    _selectedCategory = 'all_category';
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
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
                context.read<NavigationCubit>().navigateToRoute(
                  AppRoutes.homeRoute,
                );
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
        backgroundColor: AppColors.primary,
        body: BlocListener<ExpensesCubit, ExpensesState>(
          listener: (context, state) {
            print('🔄 ExpensesListScreen received state: ${state.runtimeType}');
            state.whenOrNull(
              deleteSuccess:
                  (
                    expenses,
                    deletedId,
                    selectedExpense,
                    currentPage,
                    totalPages,
                  ) {
                    print(
                      '✅ DeleteSuccess received with ${expenses.length} expenses, deletedId: $deletedId',
                    );
                    // Expense deleted successfully - UI will update automatically
                    // No need to show SnackBar here as it's handled in the delete confirmation
                  },
            );
          },
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                // Header Widget - Scrolls with content
                ExpensesHeaderWidget(
                  searchController: _searchController,
                  onSearchChanged: _onSearchChanged,
                  selectedStatus: _selectedStatus ?? '',
                  selectedCategory: _selectedCategory ?? '',
                  onStatusChanged: _onStatusChanged,
                  onCategoryChanged: _onCategoryChanged,
                  selectedSortBy: _selectedSortBy,
                  selectedSortOrder: _selectedSortOrder,
                  onSortByChanged: _onSortByChanged,
                  onSortOrderChanged: _onSortOrderChanged,
                ),

                // Expenses List Content
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ExpensesCubit.get(context).loadFirstPage(
                        refresh: true,
                        search: _searchController.text.isEmpty
                            ? null
                            : _searchController.text,
                        status: _selectedStatus == 'all_status'
                            ? null
                            : _selectedStatus,
                        categoryId: _selectedCategory == 'all_category'
                            ? null
                            : int.tryParse(_selectedCategory ?? ''),
                        sortBy: _selectedSortBy,
                        sortOrder: _selectedSortOrder,
                      );
                      ExpenseCategoriesCubit.get(
                        context,
                      ).loadFirstPage(refresh: true);
                    },
                    child: ExpensesStateBuilder(
                      onExpenseTap: (expense) =>
                          _showExpenseOptions(context, expense),
                      onExpenseView: _navigateToExpenseDetails,
                      onExpenseEdit: _navigateToEditExpense,
                      onExpenseDelete: _showDeleteConfirmation,
                      onAddExpense: _navigateToAddExpense,
                      onRetry: _retry,
                      selectedStatus: _selectedStatus ?? '',
                      selectedCategory: _selectedCategory ?? '',
                      onStatusChanged: _onStatusChanged,
                      onCategoryChanged: _onCategoryChanged,
                      scrollController: _scrollController,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            final s = S.of(context);
            return PermissionWidget(
              permission: ExpensesPermissions.create,
              fallback: Tooltip(
                message: s.expensesNoPermissionToAct,
                child: FloatingActionButton(
                  onPressed: null,
                  backgroundColor: AppColors.primary.withOpacity(0.5),
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(Icons.lock_outline, size: 22.sp),
                ),
              ),
              child: FloatingActionButton(
                onPressed: _navigateToAddExpense,
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(Icons.add, size: 22.sp),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      ExpensesCubit.get(context).loadFirstPage(
        refresh: true,
        search: query.isEmpty ? null : query,
        status: _selectedStatus == 'all_status' ? null : _selectedStatus,
        categoryId: _selectedCategory == 'all_category'
            ? null
            : int.tryParse(_selectedCategory ?? ''),
        sortBy: _selectedSortBy,
        sortOrder: _selectedSortOrder,
      );
    });
  }

  void _onStatusChanged(String status) {
    setState(() {
      _selectedStatus = status;
    });
    ExpensesCubit.get(context).loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: status == 'all_status' ? null : status,
      categoryId: _selectedCategory == 'all_category'
          ? null
          : int.tryParse(_selectedCategory ?? ''),
      sortBy: _selectedSortBy,
      sortOrder: _selectedSortOrder,
    );
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
    ExpensesCubit.get(context).loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all_status' ? null : _selectedStatus,
      categoryId: category == 'all_category' ? null : int.tryParse(category),
      sortBy: _selectedSortBy,
      sortOrder: _selectedSortOrder,
    );
  }

  void _onSortByChanged(String sortBy) {
    setState(() {
      _selectedSortBy = sortBy;
    });
    ExpensesCubit.get(context).loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all_status' ? null : _selectedStatus,
      categoryId: _selectedCategory == 'all_category'
          ? null
          : int.tryParse(_selectedCategory ?? ''),
      sortBy: _selectedSortBy,
      sortOrder: _selectedSortOrder,
    );
  }

  void _onSortOrderChanged(String sortOrder) {
    setState(() {
      _selectedSortOrder = sortOrder;
    });
    ExpensesCubit.get(context).loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all_status' ? null : _selectedStatus,
      categoryId: _selectedCategory == 'all_category'
          ? null
          : int.tryParse(_selectedCategory ?? ''),
      sortBy: _selectedSortBy,
      sortOrder: _selectedSortOrder,
    );
  }

  void _navigateToAddExpense() {
    if (_isNavigating) return;

    setState(() {
      _isNavigating = true;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddExpenseScreenWithProvider(),
        settings: const RouteSettings(name: '/add-expense'),
      ),
    ).then((_) {
      if (mounted) {
        setState(() {
          _isNavigating = false;
        });
      }
    });
  }

  void _navigateToExpenseDetails(ExpenseModel expense) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ExpenseDetailsScreenWithProvider(expense: expense),
        settings: const RouteSettings(name: '/expense-details'),
      ),
    );
  }

  void _navigateToEditExpense(ExpenseModel expense) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditExpenseScreenWithProvider(expense: expense),
        settings: const RouteSettings(name: '/edit-expense'),
      ),
    );
  }

  void _showExpenseOptions(BuildContext context, ExpenseModel expense) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ExpenseOptionsBottomSheet(
        expense: expense,
        onView: () {
          Navigator.pop(context);
          _navigateToExpenseDetails(expense);
        },
        onEdit: () {
          Navigator.pop(context);
          _navigateToEditExpense(expense);
        },
        onDelete: () {
          Navigator.pop(context);
          _showDeleteConfirmation(expense);
        },
      ),
    );
  }

  void _showDeleteConfirmation(ExpenseModel expense) {
    final expensesCubit = ExpensesCubit.get(context);
    showDialog(
      context: context,
      builder: (context) => DeleteExpenseDialog(
        expense: expense,
        onConfirm: () {
          expensesCubit.deleteExpense(expense.id);
        },
      ),
    );
  }

  void _retry() {
    ExpensesCubit.get(context).loadFirstPage(refresh: true);
  }
}
