import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';

class CreateExpense implements UseCase<ExpenseModel, CreateExpenseParams> {
  final ExpensesRepository repository;

  CreateExpense(this.repository);

  @override
  Future<ApiResult<ExpenseModel>> call(CreateExpenseParams params) async {
    return await repository.createExpense(
      expenseCategoryId: params.expenseCategoryId,
      title: params.title,
      description: params.description,
      amount: params.amount,
      expenseDate: params.expenseDate,
      referenceNumber: params.referenceNumber,
      paymentMethod: params.paymentMethod,
      notes: params.notes,
      attachment: params.attachment,
    );
  }
}

class CreateExpenseParams {
  final int expenseCategoryId;
  final String title;
  final String? description;
  final double amount;
  final String expenseDate;
  final String? referenceNumber;
  final String paymentMethod;
  final String? notes;
  final String? attachment;

  const CreateExpenseParams({
    required this.expenseCategoryId,
    required this.title,
    this.description,
    required this.amount,
    required this.expenseDate,
    this.referenceNumber,
    required this.paymentMethod,
    this.notes,
    this.attachment,
  });
}
