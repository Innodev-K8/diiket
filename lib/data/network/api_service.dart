import 'package:diiket/data/network/interceptors/auth_interceptor.dart';
import 'package:diiket/data/network/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiProvider = Provider<Dio>((ref) {
  return ApiService.create();
});

class ApiService {
  static final productionUrl = 'https://diiket.rejoin.id/api/v1';
  static final debuggingUrl = 'https://c88b415090bd.ngrok.io/api/v1';

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: kReleaseMode ? productionUrl : debuggingUrl,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      LoggingInterceptors(),
    ]);

    return dio;
  }
}
