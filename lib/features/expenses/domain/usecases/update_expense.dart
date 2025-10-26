import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';

class UpdateExpense implements UseCase<ExpenseModel, UpdateExpenseParams> {
  final ExpensesRepository repository;

  UpdateExpense(this.repository);

  @override
  Future<ApiResult<ExpenseModel>> call(UpdateExpenseParams params) async {
    return await repository.updateExpense(
      id: params.id,
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

class UpdateExpenseParams {
  final int id;
  final int? expenseCategoryId;
  final String? title;
  final String? description;
  final double? amount;
  final String? expenseDate;
  final String? referenceNumber;
  final String? paymentMethod;
  final String? notes;
  final String? attachment;

  const UpdateExpenseParams({
    required this.id,
    this.expenseCategoryId,
    this.title,
    this.description,
    this.amount,
    this.expenseDate,
    this.referenceNumber,
    this.paymentMethod,
    this.notes,
    this.attachment,
  });
}
