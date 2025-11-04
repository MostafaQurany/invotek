import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_client.dart';

import '../../domain/entit/expense_category_model.dart';
import '../models/expense_category_api_model.dart';
import '../models/request/create_expense_category_request.dart';
import '../models/request/update_expense_category_request.dart';

class ExpenseCategoriesRepository {
  final ApiClient _apiClient;

  ExpenseCategoriesRepository(this._apiClient);

  Future<ApiResult<List<ExpenseCategoryModel>>> getExpenseCategories({
    String? search,
    String? status,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _apiClient.getExpenseCategories(
        search: search,
        status: status,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      final data = response.data ?? [];
      final categories = data
          .map((c) => _convertToExpenseCategoryModel(c))
          .toList();
      return ApiResult.success(categories);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ExpenseCategoryModel>> getExpenseCategoryById(int id) async {
    try {
      final response = await _apiClient.getExpenseCategoryById(id);
      if (response.data == null) {
        return ApiResult.failure(
          ApiErrorHandler.handleError(Exception('Category not found')),
        );
      }
      return ApiResult.success(_convertToExpenseCategoryModel(response.data!));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ExpenseCategoryModel>> createExpenseCategory({
    required String name,
    String status = 'active',
    String? description,
    String? color,
    String? icon,
  }) async {
    try {
      final response = await _apiClient.createExpenseCategory(
        CreateExpenseCategoryRequest(
          name: name,
          status: status,
          description: description,
          color: color,
          icon: icon,
        ),
      );
      if (response.id == null) {
        return ApiResult.failure(
          ApiErrorHandler.handleError(Exception('Category not found')),
        );
      }
      return ApiResult.success(
        _convertToExpenseCategoryModel(
          ExpenseCategoryApiModel(
            id: response.id ?? 0,
            name: response.name ?? '',
            status: response.status ?? '',
            description: response.description,
            color: response.color,
            icon: response.icon,
            createdAt: response.createdAt,
            updatedAt: response.updatedAt,
          ),
        ),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ExpenseCategoryModel>> updateExpenseCategory({
    required int id,
    String? name,
    String? status,
    String? description,
    String? color,
    String? icon,
  }) async {
    try {
      final response = await _apiClient.updateExpenseCategory(
        id,
        UpdateExpenseCategoryRequest(
          name: name,
          status: status,
          description: description,
          color: color,
          icon: icon,
        ),
      );
      if (response.data == null) {
        return ApiResult.failure(
          ApiErrorHandler.handleError(Exception('Category not found')),
        );
      }
      return ApiResult.success(_convertToExpenseCategoryModel(response.data!));
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<bool>> deleteExpenseCategory(int id) async {
    try {
      await _apiClient.deleteExpenseCategory(id);
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Convert API model to ExpenseCategoryModel
  ExpenseCategoryModel _convertToExpenseCategoryModel(
    ExpenseCategoryApiModel apiCategory,
  ) {
    return ExpenseCategoryModel(
      id: apiCategory.id,
      name: apiCategory.name,
      status: apiCategory.status,
      description: apiCategory.description,
      color: apiCategory.color,
      icon: apiCategory.icon,
      createdAt: apiCategory.createdAt,
      updatedAt: apiCategory.updatedAt,
    );
  }
}
