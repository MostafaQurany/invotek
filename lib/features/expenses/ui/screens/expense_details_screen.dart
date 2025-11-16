import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/screens/edit_expense_screen.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/expenses/constants/expenses_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class ExpenseDetailsScreen extends StatefulWidget {
  final ExpenseModel expense;

  const ExpenseDetailsScreen({super.key, required this.expense});

  @override
  State<ExpenseDetailsScreen> createState() => _ExpenseDetailsScreenState();
}

class _ExpenseDetailsScreenState extends State<ExpenseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final expense = widget.expense;
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);
    final hasViewPermission = PermissionChecker.hasPermission(
      context,
      ExpensesPermissions.view,
    );

    if (!hasViewPermission) {
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
      body: CustomScrollView(
        slivers: [
          // Modern Header
          SliverToBoxAdapter(
            child: _buildModernHeaderContent(expense),
          ),

          // Content Cards
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _buildBasicInfoCard(expense),
                  SizedBox(height: 16.h),
                  _buildFinancialInfoCard(expense),
                  SizedBox(height: 16.h),
                  _buildPaymentInfoCard(expense),
                  SizedBox(height: 16.h),
                  _buildAdditionalInfoCard(expense),
                  SizedBox(height: 50.h), // Space for bottom actions
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Actions
      bottomNavigationBar: _buildBottomActions(),
    );
  }

  Widget _buildModernHeaderContent(ExpenseModel expense) {
    return Container(
      height: 280.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.6)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32.r),
          bottomRight: Radius.circular(32.r),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button and Help
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () => _showHelpDialog(),
                    icon: Icon(
                      Icons.help_outline,
                      color: AppColors.white,
                      size: 24.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // Expense Info
              Row(
                children: [
                  // Avatar
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.receipt_long,
                        color: AppColors.primary,
                        size: 32.sp,
                      ),
                    ),
                  ),

                  SizedBox(width: 20.w),

                  // Expense Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          expense.title,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          CurrencyFormatter.formatCurrency(
                            expense.amount,
                            context,
                          ),
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.white.withOpacity(0.8),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        _buildStatusChip(expense.paymentMethod),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String paymentMethod) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            _formatPaymentMethod(paymentMethod).toUpperCase(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBasicInfoCard(ExpenseModel expense) {
    final s = S.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Text(
                s.basicInformation,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Title
          _buildInfoTile(
            icon: Icons.title,
            label: s.title,
            value: expense.title,
            onAction: () => _copyToClipboard(expense.title),
            actionLabel: s.copy,
          ),

          SizedBox(height: 16.h),

          // Description
          if (expense.description != null && expense.description!.isNotEmpty)
            _buildInfoTile(
              icon: Icons.description_outlined,
              label: s.description,
              value: expense.description!,
              onAction: () => _copyToClipboard(expense.description!),
              actionLabel: s.copy,
            ),

          if (expense.description != null && expense.description!.isNotEmpty)
            SizedBox(height: 16.h),

          // Category
          BlocBuilder<ExpenseCategoriesCubit, ExpenseCategoriesState>(
            builder: (context, state) {
              return _buildInfoTile(
                icon: Icons.category_outlined,
                label: s.category,
                value: _getCategoryName(state),
              );
            },
          ),

          SizedBox(height: 16.h),

          // Date
          _buildInfoTile(
            icon: Icons.calendar_today_outlined,
            label: s.date,
            value: expense.formattedDate,
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildFinancialInfoCard(ExpenseModel expense) {
    final s = S.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.attach_money, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Text(
                s.financialInformation,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Amount
          _buildInfoTile(
            icon: Icons.monetization_on_outlined,
            label: s.amount,
            value: CurrencyFormatter.formatCurrency(expense.amount, context),
            valueColor: AppColors.primary,
            onAction: () => _copyToClipboard(
              CurrencyFormatter.formatCurrency(expense.amount, context),
            ),
            actionLabel: s.copy,
          ),

          if (expense.referenceNumber != null &&
              expense.referenceNumber!.isNotEmpty) ...[
            SizedBox(height: 16.h),
            _buildInfoTile(
              icon: Icons.receipt_outlined,
              label: s.referenceNumber,
              value: expense.referenceNumber!,
              onAction: () => _copyToClipboard(expense.referenceNumber!),
              actionLabel: s.copy,
            ),
          ],
        ],
      ),
      ),
    );
  }

  Widget _buildPaymentInfoCard(ExpenseModel expense) {
    final s = S.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.payment, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Text(
                s.paymentInformation,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          _buildInfoTile(
            icon: Icons.credit_card_outlined,
            label: s.paymentMethod,
            value: _formatPaymentMethod(expense.paymentMethod),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildAdditionalInfoCard(ExpenseModel expense) {
    if (expense.notes == null || expense.notes!.isEmpty) {
      return const SizedBox.shrink();
    }

    final s = S.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: Colors.grey.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.note_outlined, color: AppColors.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Text(
                s.additionalInformation,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          _buildInfoTile(
            icon: Icons.sticky_note_2_outlined,
            label: s.notes,
            value: expense.notes!,
            onAction: () => _copyToClipboard(expense.notes!),
            actionLabel: s.copy,
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    String? actionLabel,
    VoidCallback? onAction,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greyDark, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        if (onAction != null && actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                actionLabel,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBottomActions() {
    final s = S.of(context);
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      ExpensesPermissions.edit,
    );
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      ExpensesPermissions.delete,
    );

    return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Tooltip(
                  message: hasDeletePermission
                      ? ''
                      : s.expensesNoPermissionToAct,
                  child: OutlinedButton(
                    onPressed: hasDeletePermission
                        ? () => _showDeleteConfirmation()
                        : null,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.error),
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      disabledForegroundColor: AppColors.error.withOpacity(0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          hasDeletePermission
                              ? Icons.delete_outline
                              : Icons.lock_outline,
                          color: hasDeletePermission
                              ? AppColors.error
                              : AppColors.error.withOpacity(0.5),
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          s.delete,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: hasDeletePermission
                                ? AppColors.error
                                : AppColors.error.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                flex: 2,
                child: Tooltip(
                  message: hasEditPermission ? '' : s.expensesNoPermissionToAct,
                  child: FilledButton(
                    onPressed: hasEditPermission
                        ? () => _navigateToEditExpense(context)
                        : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      disabledBackgroundColor: AppColors.primary.withOpacity(
                        0.5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          hasEditPermission
                              ? Icons.edit_outlined
                              : Icons.lock_outline,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          s.edit,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }

  // Helper Methods
  String _getCategoryName(ExpenseCategoriesState state) {
    return state.whenOrNull(
          loaded: (categories, selectedCategory, currentPage, totalPages) {
            final category = categories.firstWhere(
              (cat) => cat.id == widget.expense.expenseCategoryId,
              orElse: () => ExpenseCategoryModel(
                id: widget.expense.expenseCategoryId,
                name: S.of(context).expensesUnknownCategory,
                status: 'active',
              ),
            );
            return category.name;
          },
        ) ??
        S.of(context).expensesLoading;
  }

  String _formatPaymentMethod(String paymentMethod) {
    final s = S.of(context);
    switch (paymentMethod.toLowerCase()) {
      case 'cash':
        return s.expensesPaymentMethodCash;
      case 'card':
        return s.expensesPaymentMethodCard;
      case 'bank_transfer':
        return s.expensesPaymentMethodBankTransfer;
      case 'check':
        return s.expensesPaymentMethodCheck;
      default:
        return paymentMethod;
    }
  }

  void _navigateToEditExpense(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditExpenseScreenWithProvider(expense: widget.expense),
        settings: const RouteSettings(name: '/edit-expense'),
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).expensesCopiedToClipboard),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _showDeleteConfirmation() {
    final expensesCubit = ExpensesCubit.get(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          S.of(context).delete,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        content: Text(
          S.of(context).expensesDeleteExpenseConfirmation(widget.expense.title),
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              expensesCubit.deleteExpense(widget.expense.id);
              Navigator.pop(context, 'deleted'); // Go back to list with result
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.help_outline, color: AppColors.primary),
            SizedBox(width: 8.w),
            Text(S.of(context).help),
          ],
        ),
        content: Text(S.of(context).expensesExpenseDetailsHelpDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }
}

class ExpenseDetailsScreenWithProvider extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseDetailsScreenWithProvider({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return ExpenseDetailsScreen(expense: expense);
  }
}
