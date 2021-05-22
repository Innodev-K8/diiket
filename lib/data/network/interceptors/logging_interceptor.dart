import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptors extends Interceptor {
  final _log = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 10,
      printEmojis: false,
      printTime: false,
      colors: false,
    ),
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log.v(
      'REQUEST[${options.method}] => PATH: ${options.path}',
    );

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    _log.v(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );

    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    _log.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );

    return super.onError(err, handler);
  }
}
