import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/widgets/headers/edit_expense_header_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/sections/add_expense_form_section.dart';
import 'package:invotek/features/expenses/ui/widgets/sections/add_expense_bottom_actions.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/expenses/constants/expenses_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class EditExpenseScreen extends StatefulWidget {
  final ExpenseModel expense;

  const EditExpenseScreen({super.key, required this.expense});

  @override
  State<EditExpenseScreen> createState() => _EditExpenseScreenState();
}

class _EditExpenseScreenState extends State<EditExpenseScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _amountController;
  late TextEditingController _expenseDateController;
  late TextEditingController _referenceNumberController;
  late TextEditingController _notesController;

  // Form data
  ExpenseCategoryModel? _selectedCategory;
  String _selectedPaymentMethod = 'cash';
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _loadExpenseCategories();
    _populateFormData();
  }

  void _initializeControllers() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _amountController = TextEditingController();
    _expenseDateController = TextEditingController();
    _referenceNumberController = TextEditingController();
    _notesController = TextEditingController();

    // Add listeners to trigger UI updates
    _titleController.addListener(_onFieldChanged);
    _amountController.addListener(_onFieldChanged);
    _expenseDateController.addListener(_onFieldChanged);
  }

  void _populateFormData() {
    final expense = widget.expense;

    _titleController.text = expense.title;
    _descriptionController.text = expense.description ?? '';
    _amountController.text = expense.amount.toString();

    // Parse the expense date
    _selectedDate = DateFormatter.parseApiDate(expense.expenseDate) ?? DateTime.now();
    _expenseDateController.text = DateFormatter.toApiFormat(_selectedDate);

    _referenceNumberController.text = expense.referenceNumber ?? '';
    _notesController.text = expense.notes ?? '';
    _selectedPaymentMethod = expense.paymentMethod;
  }

  void _loadExpenseCategories() {
    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    // Only load if categories are empty, otherwise use existing data
    if (categoriesCubit.categories.isEmpty) {
      categoriesCubit.loadFirstPage(refresh: false);
    } else {
      // Find and set the selected category
      _setSelectedCategoryFromExpense();
    }
  }

  void _setSelectedCategoryFromExpense() {
    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    final categories = categoriesCubit.categories;

    if (categories.isNotEmpty) {
      final category = categories.firstWhere(
        (cat) => cat.id == widget.expense.expenseCategoryId,
        orElse: () => ExpenseCategoryModel(
          id: widget.expense.expenseCategoryId,
          name: S.of(context).expensesUnknownCategory,
          status: 'active',
        ),
      );
      setState(() {
        _selectedCategory = category;
      });
    }
  }

  @override
  void dispose() {
    // Remove listeners before disposing
    _titleController.removeListener(_onFieldChanged);
    _amountController.removeListener(_onFieldChanged);
    _expenseDateController.removeListener(_onFieldChanged);

    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    _expenseDateController.dispose();
    _referenceNumberController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    setState(() {
      // Trigger UI rebuild to update button state
    });
  }

  bool get _isFormValid {
    final titleValid = _titleController.text.trim().isNotEmpty;
    final amountValid =
        _amountController.text.trim().isNotEmpty &&
        double.tryParse(_amountController.text.trim()) != null &&
        double.parse(_amountController.text.trim()) > 0;
    final categoryValid = _selectedCategory != null;

    return titleValid && amountValid && categoryValid;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      ExpensesPermissions.edit,
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
      backgroundColor: AppColors.primary,
      body: BlocListener<ExpensesCubit, ExpensesState>(
        listener: (context, state) {
          state.whenOrNull(
            updateSuccess:
                (
                  expenses,
                  updated,
                  selectedExpense,
                  currentPage,
                  totalPages,
                ) async {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  await messenger
                      .showSnackBar(
                        SnackBar(
                          content: Text(
                            S.of(context).expenseUpdatedSuccessfully,
                          ),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      )
                      .closed;
                  Navigator.pop(context);
                },
            failure:
                (expenses, selectedExpense, currentPage, totalPages, error) {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  messenger.showSnackBar(
                    SnackBar(
                      content: Text(
                        s.expensesErrorOccurred(error.toString()),
                      ),
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
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              // Header Section
              SliverToBoxAdapter(child: EditExpenseHeaderWidget()),

              // Form Content Section
              SliverToBoxAdapter(
                child: AddExpenseFormSection(
                  titleController: _titleController,
                  descriptionController: _descriptionController,
                  amountController: _amountController,
                  referenceNumberController: _referenceNumberController,
                  notesController: _notesController,
                  selectedCategory: _selectedCategory,
                  selectedPaymentMethod: _selectedPaymentMethod,
                  selectedDate: _selectedDate,
                  onDateSelected: (date) => _selectDate(),
                  onCategoryChanged: (category) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  onPaymentMethodChanged: (method) {
                    setState(() {
                      _selectedPaymentMethod = method;
                    });
                  },
                ),
              ),

              // Bottom Actions Section
              SliverToBoxAdapter(
                child: AddExpenseBottomActions(
                  onSaveExpense: _updateExpense,
                  isFormValid: _isFormValid,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _expenseDateController.text = DateFormatter.toApiFormat(picked);
      });
    }
  }

  void _updateExpense() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).pleaseSelectCategory),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
      return;
    }

    final expensesCubit = ExpensesCubit.get(context);
    expensesCubit.updateExpense(
      id: widget.expense.id,
      expenseCategoryId: _selectedCategory!.id,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim().isEmpty
          ? null
          : _descriptionController.text.trim(),
      amount: double.parse(_amountController.text.trim()),
      expenseDate: _expenseDateController.text.trim(),
      referenceNumber: _referenceNumberController.text.trim().isEmpty
          ? null
          : _referenceNumberController.text.trim(),
      paymentMethod: _selectedPaymentMethod,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );
  }
}

class EditExpenseScreenWithProvider extends StatelessWidget {
  final ExpenseModel expense;

  const EditExpenseScreenWithProvider({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    // No need to provide cubits here since they're already available
    // from the centralized AppProviders
    return EditExpenseScreen(expense: expense);
  }
}
