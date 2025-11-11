class SettingsPermissions {
  // Settings permissions
  static const String view = 'dashboard.settings';

  // Tax integration permissions
  static const String taxIntegrationView = 'tax-integration.merchant-code.view';

  // All settings permissions
  static const List<String> all = [
    view,
    taxIntegrationView,
  ];
}

