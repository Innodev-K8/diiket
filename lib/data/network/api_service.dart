import 'dart:io';

import 'package:diiket/data/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_firebase_performance/dio_firebase_performance.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiProvider = Provider<Dio>((ref) {
  return ApiService.create();
});

class ApiService {
  static const productionUrl = 'https://diiket.rejoin.id/api/v1';
  static const debuggingUrl = 'https://82144c857d4f.ngrok.io/api/v1';

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        // baseUrl: kReleaseMode ? productionUrl : debuggingUrl,
        baseUrl: productionUrl,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      if (!Platform.environment.containsKey('FLUTTER_TEST'))
        DioFirebasePerformanceInterceptor(),
      // LoggingInterceptors(),
    ]);

    return dio;
  }
}
