import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/cubits/currency_cubit.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/network/cache_module.dart';
import 'package:invotek/core/network/cache_policies.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_factory.dart';
import 'package:invotek/core/theme/theme_provider.dart';
import 'package:invotek/features/auth/data/data_source/auth_data_source.dart';
import 'package:invotek/features/auth/data/data_source/permissions_data_source.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/domain/repo/permissions_repo.dart';
import 'package:invotek/features/auth/domain/usecases/forget_password.dart';
import 'package:invotek/features/auth/domain/usecases/google_login.dart';
import 'package:invotek/features/auth/domain/usecases/login.dart';
import 'package:invotek/features/auth/domain/usecases/logout.dart';
import 'package:invotek/features/auth/domain/usecases/register.dart';
import 'package:invotek/features/auth/domain/usecases/reset_password.dart';
import 'package:invotek/features/auth/domain/usecases/verify_code.dart';
// Removed: old ClientsDataSource (now centralized in ApiClient)
import 'package:invotek/features/clients/data/repository/clients_repository.dart';
import 'package:invotek/features/clients/demo/cubit/clients_cubit.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/usecases/create_customer.dart';
import 'package:invotek/features/customers/domain/usecases/delete_customer.dart';
import 'package:invotek/features/customers/domain/usecases/get_customer_by_id.dart';
import 'package:invotek/features/customers/domain/usecases/get_customer_invoices.dart';
import 'package:invotek/features/customers/domain/usecases/get_customers.dart';
import 'package:invotek/features/customers/domain/usecases/update_customer.dart';
import 'package:invotek/features/expenses/data/repository/expense_categories_repository.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/domain/usecases/create_expense.dart';
import 'package:invotek/features/expenses/domain/usecases/create_expense_category.dart';
import 'package:invotek/features/expenses/domain/usecases/delete_expense.dart';
import 'package:invotek/features/expenses/domain/usecases/delete_expense_category.dart';
import 'package:invotek/features/expenses/domain/usecases/get_expense_by_id.dart';
import 'package:invotek/features/expenses/domain/usecases/get_expense_categories.dart';
import 'package:invotek/features/expenses/domain/usecases/get_expenses.dart';
import 'package:invotek/features/expenses/domain/usecases/update_expense.dart';
import 'package:invotek/features/expenses/domain/usecases/update_expense_category.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/domain/usecases/create_invoice.dart';
import 'package:invotek/features/invoices/domain/usecases/delete_invoice.dart';
import 'package:invotek/features/invoices/domain/usecases/get_invoice_by_id.dart';
import 'package:invotek/features/invoices/domain/usecases/get_invoices.dart';
import 'package:invotek/features/invoices/domain/usecases/update_invoice.dart';
import 'package:invotek/features/invoices/demo/cubit/credit_invoices_cubit.dart';
import 'package:invotek/features/onboarding/demo/cubit/onboarding_cubit.dart';
// Removed: old ProductsDataSource (now centralized in ApiClient)
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/cubit/categories_cubit.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/domain/usecases/create_category.dart';
import 'package:invotek/features/products/domain/usecases/create_product.dart';
import 'package:invotek/features/products/domain/usecases/delete_category.dart';
import 'package:invotek/features/products/domain/usecases/delete_product.dart';
import 'package:invotek/features/products/domain/usecases/get_categories.dart';
import 'package:invotek/features/products/domain/usecases/get_product_by_id.dart';
import 'package:invotek/features/products/domain/usecases/get_products.dart';
import 'package:invotek/features/products/domain/usecases/update_category.dart';
import 'package:invotek/features/products/domain/usecases/update_product.dart';
import 'package:invotek/features/users_and_permissions/data/data_source/users_permissions_data_source.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_cubit.dart'
    as OldPermissionsCubit;
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/domain/usecases/create_user.dart';
import 'package:invotek/features/users_and_permissions/domain/usecases/delete_user.dart';
import 'package:invotek/features/users_and_permissions/domain/usecases/get_user_by_id.dart';
import 'package:invotek/features/users_and_permissions/domain/usecases/get_users.dart';
import 'package:invotek/features/users_and_permissions/domain/usecases/update_user.dart';
// Settings feature imports
import 'package:invotek/features/settings/data/data_source/settings_data_source.dart';
import 'package:invotek/features/settings/data/repository/settings_repository.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart'
    as SettingsDomain;
import 'package:invotek/features/settings/domain/usecases/get_profile.dart';
import 'package:invotek/features/settings/domain/usecases/update_profile.dart'
    as SettingsUpdateProfile;
import 'package:invotek/features/settings/domain/usecases/change_password.dart'
    as SettingsChangePassword;
import 'package:invotek/features/settings/domain/usecases/update_photo.dart';
import 'package:invotek/features/settings/domain/usecases/delete_account.dart'
    as SettingsDeleteAccount;
import 'package:invotek/features/settings/domain/usecases/get_company_settings.dart';
import 'package:invotek/features/settings/domain/usecases/update_company_settings.dart';
import 'package:invotek/features/settings/cubit/profile_cubit.dart';
import 'package:invotek/features/settings/cubit/update_profile_cubit.dart';
import 'package:invotek/features/settings/cubit/photo_cubit.dart';
import 'package:invotek/features/settings/cubit/company_cubit.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
// Notifications feature imports
import 'package:invotek/core/services/local_notification_service.dart';
import 'package:invotek/features/notifications/data/datasources/notifications_data_source.dart';
import 'package:invotek/features/notifications/data/repositories/notifications_repository_impl.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';
import 'package:invotek/features/notifications/domain/usecases/clear_read_notifications_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/delete_notification_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/get_all_notifications_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/get_notification_stats_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/get_single_notification_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/mark_all_notifications_as_read_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/mark_notification_as_read_usecase.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_cubit.dart';
// Printing feature imports
import 'package:invotek/features/printing/core/controllers/pos_printer_controller.dart';
import 'package:invotek/features/printing/core/services/printer_service.dart';
import 'package:invotek/features/printing/presentation/cubit/printer_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // Register CacheModule (must be initialized first)
  getIt.registerSingletonAsync<CacheModule>(
    () => CacheModule.init(persistent: true),
  );

  // Wait for CacheModule to be ready
  await getIt.isReady<CacheModule>();

  // Register CachePolicies
  getIt.registerLazySingleton<CachePolicies>(
    () => CachePolicies(getIt<CacheModule>().options),
  );

  // Register Dio using DioFactory with cache
  getIt.registerLazySingleton<Dio>(
    () => DioFactory.create(getIt<CacheModule>()),
  );

  // Register API client
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt<Dio>()));

  // Register data sources
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSource(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<UsersPermissionsDataSource>(
    () => UsersPermissionsDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<SettingsDataSource>(
    () => SettingsDataSource(getIt<ApiClient>()),
  );

  // Register repositories
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt<AuthDataSource>(), getIt<PermissionsRepo>()),
  );
  getIt.registerLazySingleton<UsersRepository>(
    () => UsersRepository(getIt<UsersPermissionsDataSource>()),
  );
  getIt.registerLazySingleton<ClientsRepository>(
    () => ClientsRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<CustomersRepository>(
    () => CustomersRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ExpensesRepository>(
    () => ExpensesRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<ExpenseCategoriesRepository>(
    () => ExpenseCategoriesRepository(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<InvoiceRepository>(
    () => InvoiceRepository(apiClient: getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<SettingsDomain.ISettingsRepository>(
    () => SettingsRepository(getIt<SettingsDataSource>()),
  );

  // Register Use Cases
  // Customers Use Cases
  getIt.registerLazySingleton<GetCustomers>(
    () => GetCustomers(getIt<CustomersRepository>()),
  );
  getIt.registerLazySingleton<GetCustomerById>(
    () => GetCustomerById(getIt<CustomersRepository>()),
  );
  getIt.registerLazySingleton<CreateCustomer>(
    () => CreateCustomer(getIt<CustomersRepository>()),
  );
  getIt.registerLazySingleton<UpdateCustomer>(
    () => UpdateCustomer(getIt<CustomersRepository>()),
  );
  getIt.registerLazySingleton<DeleteCustomer>(
    () => DeleteCustomer(getIt<CustomersRepository>()),
  );
  getIt.registerLazySingleton<GetCustomerInvoices>(
    () => GetCustomerInvoices(getIt<InvoiceRepository>()),
  );

  // Products Use Cases
  getIt.registerLazySingleton<GetProducts>(
    () => GetProducts(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<GetProductById>(
    () => GetProductById(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<CreateProduct>(
    () => CreateProduct(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<UpdateProduct>(
    () => UpdateProduct(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<DeleteProduct>(
    () => DeleteProduct(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<GetCategories>(
    () => GetCategories(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<CreateCategory>(
    () => CreateCategory(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<UpdateCategory>(
    () => UpdateCategory(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<DeleteCategory>(
    () => DeleteCategory(getIt<ProductsRepository>()),
  );

  // Expenses Use Cases
  getIt.registerLazySingleton<GetExpenses>(
    () => GetExpenses(getIt<ExpensesRepository>()),
  );
  getIt.registerLazySingleton<GetExpenseById>(
    () => GetExpenseById(getIt<ExpensesRepository>()),
  );
  getIt.registerLazySingleton<CreateExpense>(
    () => CreateExpense(getIt<ExpensesRepository>()),
  );
  getIt.registerLazySingleton<UpdateExpense>(
    () => UpdateExpense(getIt<ExpensesRepository>()),
  );
  getIt.registerLazySingleton<DeleteExpense>(
    () => DeleteExpense(getIt<ExpensesRepository>()),
  );
  getIt.registerLazySingleton<GetExpenseCategories>(
    () => GetExpenseCategories(getIt<ExpenseCategoriesRepository>()),
  );
  getIt.registerLazySingleton<CreateExpenseCategory>(
    () => CreateExpenseCategory(getIt<ExpenseCategoriesRepository>()),
  );
  getIt.registerLazySingleton<UpdateExpenseCategory>(
    () => UpdateExpenseCategory(getIt<ExpenseCategoriesRepository>()),
  );
  getIt.registerLazySingleton<DeleteExpenseCategory>(
    () => DeleteExpenseCategory(getIt<ExpenseCategoriesRepository>()),
  );

  // Invoices Use Cases
  getIt.registerLazySingleton<GetInvoices>(
    () => GetInvoices(getIt<InvoiceRepository>()),
  );
  getIt.registerLazySingleton<GetInvoiceById>(
    () => GetInvoiceById(getIt<InvoiceRepository>()),
  );
  getIt.registerLazySingleton<CreateInvoice>(
    () => CreateInvoice(getIt<InvoiceRepository>()),
  );
  getIt.registerLazySingleton<UpdateInvoice>(
    () => UpdateInvoice(getIt<InvoiceRepository>()),
  );
  getIt.registerLazySingleton<DeleteInvoice>(
    () => DeleteInvoice(getIt<InvoiceRepository>()),
  );

  // Settings Use Cases
  getIt.registerLazySingleton<GetProfile>(
    () => GetProfile(getIt<SettingsDomain.ISettingsRepository>()),
  );
  getIt.registerLazySingleton<SettingsUpdateProfile.UpdateProfile>(
    () => SettingsUpdateProfile.UpdateProfile(
      getIt<SettingsDomain.ISettingsRepository>(),
    ),
  );
  getIt.registerLazySingleton<SettingsChangePassword.ChangePassword>(
    () => SettingsChangePassword.ChangePassword(
      getIt<SettingsDomain.ISettingsRepository>(),
    ),
  );
  getIt.registerLazySingleton<UpdatePhoto>(
    () => UpdatePhoto(getIt<SettingsDomain.ISettingsRepository>()),
  );
  getIt.registerLazySingleton<SettingsDeleteAccount.DeleteAccount>(
    () => SettingsDeleteAccount.DeleteAccount(
      getIt<SettingsDomain.ISettingsRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetCompanySettings>(
    () => GetCompanySettings(getIt<SettingsDomain.ISettingsRepository>()),
  );

  // Auth Use Cases
  getIt.registerLazySingleton<Login>(() => Login(getIt<AuthRepo>()));
  getIt.registerLazySingleton<Register>(() => Register(getIt<AuthRepo>()));
  getIt.registerLazySingleton<GoogleLogin>(
    () => GoogleLogin(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<ForgetPassword>(
    () => ForgetPassword(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<VerifyCode>(() => VerifyCode(getIt<AuthRepo>()));
  getIt.registerLazySingleton<ResetPassword>(
    () => ResetPassword(getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<Logout>(() => Logout(getIt<AuthRepo>()));

  // Users & Permissions Use Cases
  getIt.registerLazySingleton<GetUsers>(
    () => GetUsers(getIt<UsersRepository>()),
  );
  getIt.registerLazySingleton<GetUserById>(
    () => GetUserById(getIt<UsersRepository>()),
  );
  getIt.registerLazySingleton<CreateUser>(
    () => CreateUser(getIt<UsersRepository>()),
  );
  getIt.registerLazySingleton<UpdateUser>(
    () => UpdateUser(getIt<UsersRepository>()),
  );
  getIt.registerLazySingleton<DeleteUser>(
    () => DeleteUser(getIt<UsersRepository>()),
  );

  // Register cubits (use factory so each screen gets a fresh instance)
  getIt.registerFactory<LocalizationCubit>(() => LocalizationCubit());
  getIt.registerFactory<CurrencyCubit>(() => CurrencyCubit());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
  getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  // MenuCubit removed from DI to prevent closing issues - created locally in screens
  getIt.registerFactory<UsersCubit>(() => UsersCubit(getIt<UsersRepository>()));
  getIt.registerFactory<OldPermissionsCubit.PermissionsCubit>(
    () => OldPermissionsCubit.PermissionsCubit(),
  );
  getIt.registerFactory<ClientsCubit>(
    () => ClientsCubit(getIt<ClientsRepository>()),
  );
  getIt.registerLazySingleton<ProductsCubit>(
    () => ProductsCubit(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<CustomersCubit>(
    () => CustomersCubit(
      getCustomers: getIt<GetCustomers>(),
      getCustomerById: getIt<GetCustomerById>(),
      createCustomer: getIt<CreateCustomer>(),
      updateCustomer: getIt<UpdateCustomer>(),
      deleteCustomer: getIt<DeleteCustomer>(),
    ),
  );
  getIt.registerLazySingleton<CategoriesCubit>(
    () => CategoriesCubit(getIt<ProductsRepository>()),
  );
  getIt.registerLazySingleton<ExpensesCubit>(
    () => ExpensesCubit(getIt<ExpensesRepository>()),
  );
  getIt.registerLazySingleton<ExpenseCategoriesCubit>(
    () => ExpenseCategoriesCubit(getIt<ExpenseCategoriesRepository>()),
  );
  getIt.registerLazySingleton<InvoicesCubit>(
    () => InvoicesCubit(getIt<InvoiceRepository>()),
  );
  getIt.registerLazySingleton<CreditInvoicesCubit>(
    () => CreditInvoicesCubit(getIt<InvoiceRepository>()),
  );
  // Settings cubits
  getIt.registerFactory<ProfileCubit>(
    () => ProfileCubit(getProfileUseCase: getIt<GetProfile>()),
  );
  getIt.registerFactory<UpdateProfileCubit>(
    () => UpdateProfileCubit(
      updateProfileUseCase: getIt<SettingsUpdateProfile.UpdateProfile>(),
    ),
  );
  getIt.registerFactory<PhotoCubit>(
    () => PhotoCubit(updatePhotoUseCase: getIt<UpdatePhoto>()),
  );
  getIt.registerLazySingleton<UpdateCompanySettings>(
    () => UpdateCompanySettings(getIt<SettingsDomain.ISettingsRepository>()),
  );

  getIt.registerFactory<CompanyCubit>(
    () => CompanyCubit(
      getCompanySettingsUseCase: getIt<GetCompanySettings>(),
      updateCompanySettingsUseCase: getIt<UpdateCompanySettings>(),
    ),
  );
  getIt.registerFactory<TaxIntegrationCubit>(
    () => TaxIntegrationCubit(getIt<InvoiceRepository>()),
  );

  // Printing dependencies
  getIt.registerLazySingleton<PrinterService>(
    () => PrinterService(PosPrinterController.instance),
  );
  getIt.registerLazySingleton<PrinterCubit>(
    () => PrinterCubit(getIt<PrinterService>()),
  );

  // Permissions dependencies
  getIt.registerLazySingleton<PermissionsDataSource>(
    () => PermissionsDataSource(getIt<ApiClient>()),
  );
  getIt.registerLazySingleton<PermissionsRepo>(
    () => PermissionsRepo(getIt<PermissionsDataSource>()),
  );
  getIt.registerLazySingleton<PermissionsCubit>(
    () => PermissionsCubit(getIt<PermissionsRepo>()),
  );

  // Register theme provider
  getIt.registerLazySingleton<ThemeProvider>(() => ThemeProvider());

  // Notifications dependencies
  _notificationsLayer();
}

void _notificationsLayer() {
  // Data Source
  getIt.registerLazySingleton<NotificationsDataSource>(
    () => NotificationsDataSource(getIt<ApiClient>()),
  );

  // Repository
  getIt.registerLazySingleton<NotificationsRepository>(
    () => NotificationsRepositoryImpl(getIt<NotificationsDataSource>()),
  );

  // Use Cases
  getIt.registerLazySingleton<GetAllNotificationsUseCase>(
    () => GetAllNotificationsUseCase(getIt<NotificationsRepository>()),
  );
  getIt.registerLazySingleton<GetNotificationStatsUseCase>(
    () => GetNotificationStatsUseCase(getIt<NotificationsRepository>()),
  );
  getIt.registerLazySingleton<GetSingleNotificationUseCase>(
    () => GetSingleNotificationUseCase(getIt<NotificationsRepository>()),
  );
  getIt.registerLazySingleton<MarkNotificationAsReadUseCase>(
    () => MarkNotificationAsReadUseCase(getIt<NotificationsRepository>()),
  );
  getIt.registerLazySingleton<MarkAllNotificationsAsReadUseCase>(
    () => MarkAllNotificationsAsReadUseCase(getIt<NotificationsRepository>()),
  );
  getIt.registerLazySingleton<DeleteNotificationUseCase>(
    () => DeleteNotificationUseCase(getIt<NotificationsRepository>()),
  );
  getIt.registerLazySingleton<ClearReadNotificationsUseCase>(
    () => ClearReadNotificationsUseCase(getIt<NotificationsRepository>()),
  );

  // Cubit
  getIt.registerLazySingleton<NotificationsCubit>(
    () => NotificationsCubit(
      getAllNotifications: getIt<GetAllNotificationsUseCase>(),
      getNotificationStats: getIt<GetNotificationStatsUseCase>(),
      getSingleNotification: getIt<GetSingleNotificationUseCase>(),
      markNotificationAsRead: getIt<MarkNotificationAsReadUseCase>(),
      markAllNotificationsAsRead: getIt<MarkAllNotificationsAsReadUseCase>(),
      deleteNotification: getIt<DeleteNotificationUseCase>(),
      clearReadNotifications: getIt<ClearReadNotificationsUseCase>(),
    ),
  );

  // Local Notification Service
  getIt.registerLazySingleton<LocalNotificationService>(
    () => LocalNotificationService(),
  );
}
