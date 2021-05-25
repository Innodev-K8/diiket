import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/auth_response.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(apiProvider));
});

class AuthService {
  Dio _dio;

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

      return AuthResponse.fromJson(response.data);
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
}
