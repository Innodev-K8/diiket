import 'dart:io';

import 'package:diiket/data/credentials.dart';
import 'package:diiket/data/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_firebase_performance/dio_firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiProvider = Provider<Dio>((ref) {
  return ApiService.create();
});

class ApiService {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Credentials.apiEndpoint,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      AuthInterceptor(),
      if (!Platform.environment.containsKey('FLUTTER_TEST') && kReleaseMode)
        DioFirebasePerformanceInterceptor(),
      // LoggingInterceptors(),
    ]);

    return dio;
  }
}
