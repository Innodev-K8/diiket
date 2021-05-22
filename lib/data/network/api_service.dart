import 'package:diiket/data/network/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';

class ApiService {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://diiket.rejoin.id/api/v1',
      ),
    );

    dio.interceptors.add(
      LoggingInterceptors(),
    );

    return dio;
  }
}
