import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/auth_response.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(apiProvider));
});

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  String _(Object path) => '/auth/$path';

  Future<AuthResponse> loginWithFirebaseToken(String token) async {
    try {
      final response = await _dio.post(
        _('login/firebase'),
        data: {
          'firebase_token': token,
          'device_name': 'mobile',
        },
      );

      return AuthResponse.fromJson(castOrFallback(response.data, {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post(_('logout'));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<User> me() async {
    try {
      final response = await _dio.get(_('me'));

      return User.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    try {
      data.putIfAbsent('_method', () => 'PATCH');

      await _dio.post(_('me'), data: data);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
