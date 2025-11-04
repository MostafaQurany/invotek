import 'package:flutter_test/flutter_test.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';

void main() {
  test('CompanySettingsResponse parses sample json', () {
    final json = {
      "id": 28,
      "name": "tester",
      "email": "tester@example.com",
      "phone": "01111111111",
      "address": "...",
      "tax_merchant_code": "48236968",
      "tax_invoice_type": "income",
      "tax_integration_active": false,
      "logo": null,
      "status": "active",
      "admin_id": 49,
      "created_at": "2025-08-31T13:33:52.000000Z",
      "updated_at": "2025-10-19T09:26:49.000000Z",
    };

    final res = CompanySettingsResponse.fromJson(json);
    expect(res.id, 28);
    expect(res.name, 'tester');
    expect(res.status, 'active');
  });
}
