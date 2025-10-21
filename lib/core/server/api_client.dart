import 'dart:io';

import 'package:dio/dio.dart';
// Removed unused: ApiResult
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/auth/data/models/google_login_request.dart';
import 'package:invotek/features/auth/data/models/google_login_respond.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/login_respond.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/data/models/register_respond.dart';
import 'package:invotek/features/clients/data/models/client_api_model.dart';
import 'package:invotek/features/customers/data/models/request/create_customer_request.dart';
import 'package:invotek/features/customers/data/models/request/update_customer_request.dart';
import 'package:invotek/features/customers/data/models/response/create_customer_response.dart';
import 'package:invotek/features/customers/data/models/response/delete_customer_response.dart';
import 'package:invotek/features/customers/data/models/response/get_all_customers_response.dart';
import 'package:invotek/features/customers/data/models/response/get_customer_by_id_response.dart';
import 'package:invotek/features/customers/data/models/response/update_customer_response.dart';
import 'package:invotek/features/expenses/data/models/expense_api_model.dart';
import 'package:invotek/features/expenses/data/models/request/create_expense_request.dart';
import 'package:invotek/features/expenses/data/models/request/update_expense_request.dart';
import 'package:invotek/features/expenses/data/models/request/create_expense_category_request.dart';
import 'package:invotek/features/expenses/data/models/request/update_expense_category_request.dart';
import 'package:invotek/features/expenses/data/models/response/get_all_expenses_response.dart';
import 'package:invotek/features/expenses/data/models/response/create_expense_response.dart';
import 'package:invotek/features/expenses/data/models/response/get_expense_by_id_response.dart';
import 'package:invotek/features/expenses/data/models/response/delete_expense_response.dart';
import 'package:invotek/features/expenses/data/models/response/get_all_expense_categories_response.dart';
import 'package:invotek/features/expenses/data/models/response/create_expense_category_response.dart';
import 'package:invotek/features/expenses/data/models/response/get_expense_category_by_id_response.dart';
import 'package:invotek/features/expenses/data/models/response/update_expense_category_response.dart';
import 'package:invotek/features/expenses/data/models/response/delete_expense_category_response.dart';
import 'package:invotek/features/invoices/data/models/requests/activating_tax_integration_request.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/responses/activating_tax_integration_responses.dart';
import 'package:invotek/features/invoices/data/models/responses/create_invoice_response.dart';
import 'package:invotek/features/invoices/data/models/responses/deactivating_tax_integration_responses.dart';
import 'package:invotek/features/invoices/data/models/responses/delete_invoice_response.dart';
import 'package:invotek/features/invoices/data/models/responses/get_all_invoices_response.dart';
import 'package:invotek/features/invoices/data/models/responses/get_invoice_response.dart';
import 'package:invotek/features/invoices/data/models/responses/get_tax_integration_status.dart';
import 'package:invotek/features/invoices/data/models/responses/update_invoice_response.dart';
import 'package:invotek/features/products/data/models/product_api_model.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/data/models/request/product_requests.dart';
import 'package:invotek/features/products/data/models/response/product/product_responses.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baserUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiConstants.login)
  Future<LoginRespond> login(@Body() LoginRequest request);

  @POST(ApiConstants.register)
  Future<RegisterRespond> register(@Body() RegisterRequest request);

  @POST(ApiConstants.logOut)
  Future<void> logout();

  @POST(ApiConstants.googleLogin)
  Future<GoogleLoginRespond> googleLogin(@Body() GoogleLoginRequest request);

  // Products
  @GET(ApiConstants.products)
  Future<GetAllProductsResponse> getProducts({
    @Query('search') String? search,
    @Query('category') String? category,
    @Query('status') String? status,
    @Query('brand') String? brand,
    @Query('min_price') double? minPrice,
    @Query('max_price') double? maxPrice,
    @Query('min_quantity') int? minQuantity,
    @Query('max_quantity') int? maxQuantity,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET(ApiConstants.productById)
  Future<ProductApiModel> getProductById(@Path('id') int id);

  @POST(ApiConstants.createProduct)
  Future<CreateProductResponse> createProduct(
    @Body() CreateProductRequest request,
  );

  @PUT(ApiConstants.updateProduct)
  Future<UpdateProductResponse> updateProduct(
    @Path('id') int id,
    @Body() UpdateProductRequest request,
  );

  @DELETE(ApiConstants.deleteProduct)
  Future<DeleteProductResponse> deleteProduct(@Path('id') int id);

  // Clients
  @GET(ApiConstants.clients)
  Future<ClientsResponse> getClients({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('company') String? company,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sortBy') String? sortBy,
    @Query('sortOrder') String? sortOrder,
  });

  @GET(ApiConstants.clientById)
  Future<ClientResponse> getClientById(@Path('id') int id);

  @POST(ApiConstants.createClient)
  Future<ClientResponse> createClient(@Body() CreateClientRequest request);

  @PUT(ApiConstants.updateClient)
  Future<ClientResponse> updateClient(
    @Path('id') int id,
    @Body() UpdateClientRequest request,
  );

  @DELETE(ApiConstants.deleteClient)
  Future<void> deleteClient(@Path('id') int id);

  @POST(ApiConstants.clientAvatar)
  @MultiPart()
  Future<ClientResponse> uploadAvatar(@Path('id') int id, @Part() File avatar);

  @GET(ApiConstants.clientsStatistics)
  Future<dynamic> getClientStatistics();

  @POST(ApiConstants.clientsBulkDelete)
  Future<void> bulkDeleteClients(@Body() List<int> clientIds);

  @POST(ApiConstants.clientsBulkUpdateStatus)
  Future<void> bulkUpdateStatus(@Body() Map<String, dynamic> request);

  // Customers
  @GET(ApiConstants.customers)
  Future<GetAllCustomersResponse> getCustomers({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('company') String? company,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sortBy') String? sortBy,
    @Query('sortOrder') String? sortOrder,
  });

  @GET(ApiConstants.customerById)
  Future<GetCustomerByIdResponse> getCustomerById(@Path('id') int id);

  @POST(ApiConstants.createCustomer)
  Future<CreateCustomerResponse> createCustomer(
    @Body() CreateCustomerRequest request,
  );

  @PUT(ApiConstants.updateCustomer)
  Future<UpdateCustomerResponse> updateCustomer(
    @Path('id') int id,
    @Body() UpdateCustomerRequest request,
  );

  @DELETE(ApiConstants.deleteCustomer)
  Future<DeleteCustomerResponse> deleteCustomer(@Path('id') int id);

  // Expenses
  @GET(ApiConstants.expenses)
  Future<GetAllExpensesResponse> getExpenses({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('category_id') int? categoryId,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
  });

  @GET(ApiConstants.expenseById)
  Future<GetExpenseByIdResponse> getExpenseById(@Path('id') int id);

  @POST(ApiConstants.createExpense)
  Future<CreateExpenseResponse> createExpense(
    @Body() CreateExpenseRequest request,
  );

  @PUT(ApiConstants.updateExpense)
  Future<ExpenseApiModel> updateExpense(
    @Path('id') int id,
    @Body() UpdateExpenseRequest request,
  );

  @DELETE(ApiConstants.deleteExpense)
  Future<DeleteExpenseResponse> deleteExpense(@Path('id') int id);

  // Expense Categories
  @GET(ApiConstants.expenseCategories)
  Future<GetAllExpenseCategoriesResponse> getExpenseCategories({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
  });

  @GET(ApiConstants.expenseCategoryById)
  Future<GetExpenseCategoryByIdResponse> getExpenseCategoryById(
    @Path('id') int id,
  );

  @POST(ApiConstants.createExpenseCategory)
  Future<CreateExpenseCategoryResponse> createExpenseCategory(
    @Body() CreateExpenseCategoryRequest request,
  );

  @PUT(ApiConstants.updateExpenseCategory)
  Future<UpdateExpenseCategoryResponse> updateExpenseCategory(
    @Path('id') int id,
    @Body() UpdateExpenseCategoryRequest request,
  );

  @DELETE(ApiConstants.deleteExpenseCategory)
  Future<DeleteExpenseCategoryResponse> deleteExpenseCategory(
    @Path('id') int id,
  );

  // Product Categories
  @GET(ApiConstants.productCategories)
  Future<ListProductCategoriesResponse> listProductCategories({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @POST(ApiConstants.productCategories)
  Future<CreateProductCategoryResponse> createProductCategory(
    @Body() CreateProductCategoryRequest request,
  );

  @GET(ApiConstants.productCategoryById)
  Future<ProductCategoryApiModel> getProductCategory(@Path('id') int id);

  @PUT(ApiConstants.productCategoryById)
  Future<ProductCategoryApiModel> updateProductCategory(
    @Path('id') int id,
    @Body() UpdateProductCategoryRequest request,
  );

  @DELETE(ApiConstants.productCategoryById)
  Future<DeleteProductCategoryResponse> deleteProductCategory(
    @Path('id') int id,
  );

  // ===== INVOICES APIs =====
  // عرض الفواتير | List Invoices
  @GET(ApiConstants.invoices)
  Future<GetAllInvoicesResponse> getAllInvoices({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('customer_id') int? customerId,
    @Query('payment_method') String? paymentMethod,
    @Query('date_from') String? dateFrom,
    @Query('date_to') String? dateTo,
    @Query('min_amount') double? minAmount,
    @Query('max_amount') double? maxAmount,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
  });

  // عرض فاتورة | Show Invoice
  @GET(ApiConstants.invoiceById)
  Future<GetInvoiceResponse> getInvoiceById(@Path('id') int id);

  // إنشاء فاتورة جديدة | Create Invoice
  @POST(ApiConstants.createInvoice)
  Future<CreateInvoiceResponse> createInvoice(
    @Body() CreateInvoiceRequest request,
  );

  // تحديث فاتورة | Update Invoice
  @PUT(ApiConstants.updateInvoice)
  Future<UpdateInvoiceResponse> updateInvoice(
    @Path('id') int id,
    @Body() UpdateInvoiceRequest request,
  );

  // حذف فاتورة | Delete Invoice
  @DELETE(ApiConstants.deleteInvoice)
  Future<DeleteInvoiceResponse> deleteInvoice(@Path('id') int id);

  // ===== TAX INTEGRATION APIs =====
  // تفعيل التكامل الضريبي | Activating tax integration
  @POST(ApiConstants.activateTaxIntegration)
  Future<ActivatingTaxIntegrationResponses> activateTaxIntegration(
    @Body() ActivatingTaxIntegrationRequest request,
  );

  // إلغاء التكامل الضريبي | Deactivating tax integration
  @POST(ApiConstants.deactivateTaxIntegration)
  Future<DeactivatingTaxIntegrationResponses> deactivateTaxIntegration();

  // حالة التكامل الضريبي | Tax integration status
  @GET(ApiConstants.taxIntegrationStatus)
  Future<GetTaxIntegrationStatus> getTaxIntegrationStatus();

  // Dashboard
  @GET(ApiConstants.dashboard)
  Future<DashboardResponse> getDashboard();
}
