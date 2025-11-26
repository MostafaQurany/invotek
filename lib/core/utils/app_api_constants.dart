class ApiConstants {
  //google key
  static const String googleServerClientId =
      "993254668806-r1864hu1nskob17pe4uf2qu9o773q4se.apps.googleusercontent.com";
  // auth
  static const String baserUrl = "https://invotik.com/api/";
  static const String login = "login";
  static const String register = "register";
  static const String logOut = "logout";
  static const String googleLogin = "auth/social/login/google";
  static const String forgetPassword = "forgot-password";
  static const String verifyCode = "verify-code";
  static const String resetPassword = "reset-password";
  static const String changePassword = "profile/change-password";
  static const String deleteAccount = "profile/account";
  // profile
  static const String profile = "profile"; // GET show, POST update
  static const String profilePhoto = "profile/photo"; // POST multipart
  // company settings
  static const String companySettings = "company/settings"; // GET

  // products
  static const String products = "company/products";
  static const String productById = "company/products/{id}";
  static const String createProduct = "company/products";
  static const String updateProduct = "company/products/{id}";
  static const String deleteProduct = "company/products/{id}";

  // product categories
  static const String productCategories = "company/product-categories";
  static const String productCategoryById = "company/product-categories/{id}";

  // clients
  static const String clients = "clients";
  static const String clientById = "clients/{id}";
  static const String createClient = "clients";
  static const String updateClient = "clients/{id}";
  static const String deleteClient = "clients/{id}";
  static const String clientAvatar = "clients/{id}/avatar";
  static const String clientsStatistics = "clients/statistics";
  static const String clientsBulkDelete = "clients/bulk-delete";
  static const String clientsBulkUpdateStatus = "clients/bulk-update-status";

  // customers
  static const String customers = "company/customers";
  static const String customerById = "company/customers/{id}";
  static const String createCustomer = "company/customers";
  static const String updateCustomer = "company/customers/{id}";
  static const String deleteCustomer = "company/customers/{id}";

  // expenses
  static const String expenses = "company/expenses";
  static const String expenseById = "company/expenses/{id}";
  static const String createExpense = "company/expenses";
  static const String updateExpense = "company/expenses/{id}";
  static const String deleteExpense = "company/expenses/{id}";

  // expense categories
  static const String expenseCategories = "company/expense-categories";
  static const String expenseCategoryById = "company/expense-categories/{id}";
  static const String createExpenseCategory = "company/expense-categories";
  static const String updateExpenseCategory = "company/expense-categories/{id}";
  static const String deleteExpenseCategory = "company/expense-categories/{id}";

  // users
  static const String users = "users";
  static const String userById = "users/{id}";
  static const String createUser = "users";
  static const String updateUser = "users/{id}";
  static const String deleteUser = "users/{id}";
  static const String changePasswordUser = "users/{id}/change-password";
  static const String uploadAvatar = "users/{id}/avatar";
  static bool valid = false;
  // ===== INVOICES APIs =====
  // الفواتير | Invoices
  static const String invoices = "company/tax-invoices";
  static const String invoiceById = "company/tax-invoices/{id}";
  static const String createInvoice = "company/tax-invoices";
  static const String updateInvoice = "company/tax-invoices/{id}";
  static const String deleteInvoice = "company/tax-invoices/{id}";
  static const String createCreditInvoice = "company/tax-invoices/{id}/create-credit";
  static const String sendInvoice = "company/tax-invoices/{id}/send";
  // Credit Invoices
  static const String creditInvoices = "company/credit-invoices";

  // ===== TAX INTEGRATION APIs =====
  // التكامل الضريبي | Tax Integration
  static const String activateTaxIntegration =
      "company/tax-integration/activate";
  static const String deactivateTaxIntegration =
      "company/tax-integration/deactivate";
  static const String taxIntegrationStatus = "company/tax-integration/status";

  // Dashboard
  static const String dashboard = "company/dashboard";

  // Permissions
  static const String rolePermissions = "company/roles/{roleId}/permissions";

  // Notifications
  static const String notifications = "company/notifications";
  static const String notificationById = "company/notifications/{id}";
  static const String notificationStats = "company/notifications/stats";
  static const String markNotificationAsRead = "notifications/{id}/read";
  static const String markAllNotificationsAsRead = "company/notifications/read-all";
  static const String clearReadNotifications = "company/notifications/clear-read";
}

class ApiKey {
  static String id = "id";
  static String name = "name";
  static String type = "type";
  static String phone = "phone";
  static String whatsPhone = "whatsPhone";
  static String authorization = "Authorization";
  static String status = "status";
  static String message = "message";
  static String data = "data";
  static String img = "img";
  static String password = "password";
  static String language = "language";
  static String imagePath = "imagePath";
  static String themeMode = "themeMode";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

enum CurrencyCode { aed, egp, sar, usd }

class AppCurrency {
  static const String currencyAr = "د.ع";
  static const String currencyEn = "JOD";

  // Currency symbols by language
  static const Map<String, Map<String, String>> _currencySymbols = {
    'AED': {'ar': 'د.إ', 'en': 'AED'},
    'JOD': {'ar': 'د.ع', 'en': 'JOD'},
    'EGP': {'ar': 'ج.م', 'en': 'EGP'},
    'SAR': {'ar': 'ر.س', 'en': 'SAR'},
    'USD': {'ar': '\$', 'en': '\$'},
  };

  // Currency names by language
  static const Map<String, Map<String, String>> _currencyNames = {
    'AED': {'ar': 'درهم إماراتي', 'en': 'UAE Dirham'},
    'EGP': {'ar': 'جنيه مصري', 'en': 'Egyptian Pound'},
    'SAR': {'ar': 'ريال سعودي', 'en': 'Saudi Riyal'},
    'USD': {'ar': 'دولار أمريكي', 'en': 'US Dollar'},
    'JOD': {'ar': 'الدينار الأردني', 'en': 'Jordanian dinar'},
  };

  /// Get currency symbol based on currency code and language
  static String getCurrencySymbol(String currencyCode, String languageCode) {
    return _currencySymbols[currencyCode]?[languageCode] ?? currencyCode;
  }

  /// Get currency name based on currency code and language
  static String getCurrencyName(String currencyCode, String languageCode) {
    return _currencyNames[currencyCode]?[languageCode] ?? currencyCode;
  }

  /// Get all available currencies
  static List<String> getAllCurrencies() {
    return ['AED', 'EGP', 'SAR', 'USD', 'JOD'];
  }

  /// Get currency symbol for Arabic
  static String getCurrencySymbolAr(String currencyCode) {
    return getCurrencySymbol(currencyCode, 'ar');
  }

  /// Get currency symbol for English
  static String getCurrencySymbolEn(String currencyCode) {
    return getCurrencySymbol(currencyCode, 'en');
  }

  /// Get currency name for Arabic
  static String getCurrencyNameAr(String currencyCode) {
    return getCurrencyName(currencyCode, 'ar');
  }

  /// Get currency name for English
  static String getCurrencyNameEn(String currencyCode) {
    return getCurrencyName(currencyCode, 'en');
  }
}
