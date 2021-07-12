import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';

// Copied from https://github.com/eyeem/dio_firebase_performance/blob/master/lib/src/dio_firebase_performance.dart

class PerformanceMonitoringInterceptor extends Interceptor {
  /// key: requestKey hash code, value: ongoing metric
  final _map = <int, HttpMetric>{};

  RequestContentLengthMethod? requestContentLengthMethod;
  ResponseContentLengthMethod? responseContentLengthMethod;

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final metric = FirebasePerformance.instance.newHttpMetric(
        options.uri.normalized(),
        options.method.asHttpMethod(),
      );

      final requestKey = options.extra.hashCode;

      _map[requestKey] = metric;

      final requestContentLength = requestContentLengthMethod?.call(options);

      // TODO:  needs check on iOS
      // SEE: https://github.com/eyeem/dio_firebase_performance/issues/6
      await metric.start();

      if (requestContentLength != null) {
        metric.requestPayloadSize = requestContentLength;
      }
    } catch (_) {}

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      final requestKey = response.requestOptions.extra.hashCode;

      final metric = _map[requestKey];

      if (responseContentLengthMethod != null) {
        metric?.setResponse(response, responseContentLengthMethod!);
      }

      await metric?.stop();

      _map.remove(requestKey);
    } catch (_) {}
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    try {
      final requestKey = err.requestOptions.extra.hashCode;

      final metric = _map[requestKey];

      if (responseContentLengthMethod != null) {
        metric?.setResponse(err.response, responseContentLengthMethod!);
      }

      await metric?.stop();

      _map.remove(requestKey);
    } catch (_) {}
    return super.onError(err, handler);
  }
}

extension _StringHttpMethod on String {
  HttpMethod asHttpMethod() {
    switch (toUpperCase()) {
      case "POST":
        return HttpMethod.Post;
      case "GET":
        return HttpMethod.Get;
      case "DELETE":
        return HttpMethod.Delete;
      case "PUT":
        return HttpMethod.Put;
      case "PATCH":
        return HttpMethod.Patch;
      case "OPTIONS":
        return HttpMethod.Options;
      default:
        // I don't know what to do with this.
        return HttpMethod.Get;
    }
  }
}

extension _UriHttpMethod on Uri {
  String normalized() {
    return "$scheme://$host$path";
  }
}

extension _ResponseHttpMetric on HttpMetric {
  void setResponse(Response? value,
      ResponseContentLengthMethod responseContentLengthMethod) {
    if (value == null) {
      return;
    }
    final responseContentLength = responseContentLengthMethod(value);
    if (responseContentLength != null) {
      responsePayloadSize = responseContentLength;
    }
    final contentType = value.headers.value.call(Headers.contentTypeHeader);
    if (contentType != null) {
      responseContentType = contentType;
    }
    if (value.statusCode != null) {
      httpResponseCode = value.statusCode;
    }
  }
}

typedef RequestContentLengthMethod = int? Function(RequestOptions options);

int? defaultRequestContentLength(RequestOptions options) {
  try {
    if (options.data is String || options.data is Map) {
      return options.headers.toString().length +
          (options.data?.toString().length ?? 0);
    }
  } catch (_) {
    return null;
  }
  return null;
}

typedef ResponseContentLengthMethod = int? Function(Response options);

int? defaultResponseContentLength(Response response) {
  if (response.data is String) {
    return (response.headers.toString().length) + response.data.length as int?;
  } else {
    return null;
  }
}
