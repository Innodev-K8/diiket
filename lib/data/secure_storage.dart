import 'dart:convert';

import 'package:diiket_core/diiket_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorage {
  static final SecureStorage _instance = SecureStorage._();

  factory SecureStorage() {
    return _instance;
  }

  SecureStorage._();

  static const authTokenKey = 'AUTH_TOKEN';
  static const selectedMarketKey = 'SELECTED_MARKET';

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

  // Market stuff
  Future<void> setSelectedMarket(Market market) async {
    await ensure();

    await _storage!.setString(selectedMarketKey, jsonEncode(market.toJson()));
  }

  Future<void> clearSelectedMarket() async {
    await ensure();

    await _storage!.remove(selectedMarketKey);
  }

  Future<Market?> getSelectedMarket() async {
    await ensure();

    final jsonMarket = _storage!.getString(selectedMarketKey);

    if (jsonMarket == null) return null;

    return Market.fromJson(castOrFallback(jsonDecode(jsonMarket), {}));
  }
}
