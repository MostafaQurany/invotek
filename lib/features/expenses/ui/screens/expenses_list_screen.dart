import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expenses_header_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/lists/expenses_state_builder.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expense_options_bottom_sheet.dart';
import 'package:invotek/features/expenses/ui/widgets/dialogs/delete_expense_dialog.dart';

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

  String? _selectedStatus;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
  }

  void _initializeOptions() {
    _selectedStatus = 'all_status';
    _selectedCategory = 'all_category';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: RefreshIndicator(
            onRefresh: () async {
              ExpensesCubit.get(context).loadFirstPage(refresh: true);
            },
            child: CustomScrollView(
              slivers: [
                // Custom Header Widget as Sliver
                SliverToBoxAdapter(
                  child: ExpensesHeaderWidget(
                    onMenuPressed: _handleMenuPressed,
                    onAddPressed: _navigateToAddExpense,
                    searchController: _searchController,
                    onSearchChanged: (query) {
                      ExpensesCubit.get(context).loadFirstPage(
                        refresh: true,
                        search: query.isEmpty ? null : query,
                        status: _selectedStatus == 'all_status'
                            ? null
                            : _selectedStatus,
                        categoryId: _selectedCategory == 'all_category'
                            ? null
                            : int.tryParse(_selectedCategory ?? ''),
                      );
                    },
                    selectedStatus: _selectedStatus ?? '',
                    selectedCategory: _selectedCategory ?? '',
                    onStatusChanged: _onStatusChanged,
                    onCategoryChanged: _onCategoryChanged,
                  ),
                ),

                // Expenses List
                ExpensesStateBuilder(
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
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddExpense,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        icon: Icon(Icons.add, size: 20.sp),
        label: Text(
          'Add Expense',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
    );
  }

  // Event Handlers
  void _handleMenuPressed() {
    ZoomDrawer.of(context)?.toggle();
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
    );
  }

  void _navigateToAddExpense() {
    // TODO: Implement when AddExpenseScreen is created
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Add Expense screen - Coming Soon!'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _navigateToExpenseDetails(ExpenseModel expense) {
    // TODO: Implement when ExpenseDetailsScreen is created
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Details screen - Coming Soon!'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _navigateToEditExpense(ExpenseModel expense) {
    // TODO: Implement when EditExpenseScreen is created
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Edit Expense screen - Coming Soon!'),
        backgroundColor: AppColors.primary,
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
