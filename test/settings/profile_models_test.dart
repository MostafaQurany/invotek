import 'package:flutter_test/flutter_test.dart';
import 'package:invotek/features/settings/data/models/profile_models.dart';

void main() {
  test('ProfileResponse parses sample json', () {
    final json = {
      "success": true,
      "data": {
        "user": {
          "id": 49,
          "name": "tester",
          "email": "tester@example.com",
          "phone": "+96278945612",
          "position": null,
          "role": "admin",
          "status": "active",
          "google_id": null,
          "apple_id": null,
          "profile_photo_url": "https://ui-avatars.com/api/?name=t&color=7F9CF5&background=EBF4FF",
          "email_verified_at": null,
          "created_at": "2025-08-31T13:33:53.000000Z",
          "updated_at": "2025-09-09T14:41:32.000000Z",
          "company": {
            "id": 28,
            "name": "tester",
            "email": "tester@example.com",
            "phone": "01111111111",
            "address": "...",
            "logo": null,
            "status": "active"
          }
        }
      }
    };

    final res = ProfileResponse.fromJson(json);
    expect(res.success, true);
    expect(res.user.id, 49);
    expect(res.user.email, 'tester@example.com');
  });
}


