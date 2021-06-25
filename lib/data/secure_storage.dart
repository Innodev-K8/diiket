import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static const AUTH_TOKEN = 'AUTH_TOKEN';

  static SharedPreferences? _storage;

  static Future<void> ensure() async {
    if (_storage == null) {
      _storage = await SharedPreferences.getInstance();
    }
  }

  static Future<void> setToken(String token) async {
    await ensure();

    await _storage!.setString(AUTH_TOKEN, token);
  }

  static Future<void> clearToken() async {
    await ensure();

    await _storage!.remove(AUTH_TOKEN);
  }

  static Future<String?> getToken() async {
    await ensure();

    return _storage!.getString(AUTH_TOKEN);
  }
}
