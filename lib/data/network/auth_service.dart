import 'dart:io';

import 'package:diiket/data/network/api_service.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(apiProvider));
});

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  String _(Object path) => '/auth/$path';

  Future<AuthResponse> loginWithFirebaseToken(String token,
      [String? fcmToken]) async {
    try {
      final response = await _dio.post(
        _('login/firebase'),
        data: {
          'firebase_token': token,
          'device_name': 'mobile',
          'fcm_token': fcmToken,
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

  Future<void> updateProfilePicture(File? image) async {
    try {
      final FormData formData = FormData.fromMap({
        "picture":
            image != null ? await MultipartFile.fromFile(image.path) : null,
      });

      await _dio.post(_('me/update/picture'), data: formData);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
