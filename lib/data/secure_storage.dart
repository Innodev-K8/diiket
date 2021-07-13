import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._();

  factory SecureStorage() {
    return _instance;
  }

  SecureStorage._();

  static const authTokenKey = 'AUTH_TOKEN';

  SharedPreferences? _storage;

  Future<void> ensure() async {
    _storage ??= await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) async {
    await ensure();

    await _storage!.setString(authTokenKey, token);
  }

  Future<void> clearToken() async {
    await ensure();

    await _storage!.remove(authTokenKey);
  }

  Future<String?> getToken() async {
    await ensure();

    return _storage!.getString(authTokenKey);
  }
}
