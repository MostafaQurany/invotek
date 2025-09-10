import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_client.dart';

import '../../demo/entit/expense_model.dart';
import '../models/expense_api_model.dart';
import '../models/request/create_expense_request.dart';
import '../models/request/update_expense_request.dart';

class ExpensesRepository {
  final ApiClient _apiClient;

  ExpensesRepository(this._apiClient);

  Future<ApiResult<List<ExpenseModel>>> getExpenses({
    String? search,
    String? status,
    int? categoryId,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _apiClient.getExpenses(
        search: search,
        status: status,
        categoryId: categoryId,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      final data = response.data ?? [];
      final expenses = data.map((e) => _convertToExpenseModel(e)).toList();
      return ApiResult.success(expenses);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ExpenseModel>> getExpenseById(int id) async {
    try {
      final response = await _apiClient.getExpenseById(id);
      if (response.data == null) {
        return ApiResult.failure(
          ApiErrorHandler.handleError(Exception('Expense not found')),
        );
      }
      return ApiResult.success(_convertToExpenseModel(response.data!));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ExpenseModel>> createExpense({
    required int expenseCategoryId,
    required String title,
    String? description,
    required double amount,
    required String expenseDate,
    String? referenceNumber,
    required String paymentMethod,
    String? notes,
    String? attachment,
  }) async {
    try {
      final response = await _apiClient.createExpense(
        CreateExpenseRequest(
          expenseCategoryId: expenseCategoryId,
          title: title,
          description: description,
          amount: amount,
          expenseDate: expenseDate,
          referenceNumber: referenceNumber,
          paymentMethod: paymentMethod,
          notes: notes,
          attachment: attachment,
        ),
      );
      if (response.data == null) {
        return ApiResult.failure(
          ApiErrorHandler.handleError(Exception('Expense not found')),
        );
      }
      return ApiResult.success(_convertToExpenseModel(response.data!));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ExpenseModel>> updateExpense({
    required int id,
    int? expenseCategoryId,
    String? title,
    String? description,
    double? amount,
    String? expenseDate,
    String? referenceNumber,
    String? paymentMethod,
    String? notes,
    String? attachment,
  }) async {
    try {
      final response = await _apiClient.updateExpense(
        id,
        UpdateExpenseRequest(
          expenseCategoryId: expenseCategoryId,
          title: title,
          description: description,
          amount: amount,
          expenseDate: expenseDate,
          referenceNumber: referenceNumber,
          paymentMethod: paymentMethod,
          notes: notes,
          attachment: attachment,
        ),
      );
      if (response.data == null) {
        return ApiResult.failure(
          ApiErrorHandler.handleError(Exception('Expense not found')),
        );
      }
      return ApiResult.success(_convertToExpenseModel(response.data!));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<bool>> deleteExpense(int id) async {
    try {
      await _apiClient.deleteExpense(id);
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Convert API model to ExpenseModel
  ExpenseModel _convertToExpenseModel(ExpenseApiModel apiExpense) {
    return ExpenseModel(
      id: apiExpense.id,
      companyId: apiExpense.companyId,
      expenseCategoryId: apiExpense.expenseCategoryId,
      title: apiExpense.title,
      description: apiExpense.description,
      amount: double.parse(apiExpense.amount),
      expenseDate: apiExpense.expenseDate,
      referenceNumber: apiExpense.referenceNumber,
      paymentMethod: apiExpense.paymentMethod,
      notes: apiExpense.notes,
      attachment: apiExpense.attachment,
      createdBy: apiExpense.createdBy.toString(),
      createdAt: apiExpense.createdAt,
      updatedAt: apiExpense.updatedAt,
    );
  }
}
