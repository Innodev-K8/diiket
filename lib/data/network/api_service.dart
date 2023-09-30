import 'package:diiket/data/credentials.dart';
import 'package:diiket/data/network/interceptors/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final apiProvider = Provider<Dio>((ref) {
  return ApiService.create();
});

// ignore: avoid_classes_with_only_static_members
abstract class ApiService {
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
      // if (!Platform.environment.containsKey('FLUTTER_TEST') && kReleaseMode)
      //   DioFirebasePerformanceInterceptor(),
      // LoggingInterceptors(),
    ]);

    return dio;
  }
}
