import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const AUTH_TOKEN = 'AUTH_TOKEN';

  static final _storage = FlutterSecureStorage();

  static Future<void> setToken(String token) async {
    await _storage.write(key: AUTH_TOKEN, value: token);
  }

  static Future<void> clearToken() async {
    await _storage.delete(key: AUTH_TOKEN);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: AUTH_TOKEN);
  }
}
