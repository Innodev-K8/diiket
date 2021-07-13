import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class LoggingInterceptors extends Interceptor {
  final _log = Logger(
      // printer: PrettyPrinter(lineLength: 0),
      );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log.v(
      'REQUEST[${options.method}] => PATH: ${options.path}\n'
      'queryParameters => ${options.queryParameters}\n'
      'data => ${options.data}',
    );

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    _log.v(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}\nRESPONSE: $response',
    );

    return super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    _log.e(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}\nRESPONSE: ${err.response}',
    );

    return super.onError(err, handler);
  }
}
