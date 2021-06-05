import 'package:dio/src/dio_error.dart';

class CustomException implements Exception {
  final String? message;
  final int code;

  const CustomException({
    this.message = 'Terjadi kesalahan!',
    this.code = 0,
  });

  @override
  String toString() {
    return "CustomException { message: $message, code: $code }";
  }

  factory CustomException.fromDioError(DioError error) {
    String message = 'Terjadi kesalahan';

    switch (error.type) {
      case DioErrorType.connectTimeout:
        message = 'Waktu koneksi ke server habis.';
        break;
      case DioErrorType.sendTimeout:
        message = 'Waktu pengiriman ke server habis.';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Waktu penerimaan ke server habis.';
        break;
      case DioErrorType.cancel:
        message = 'Permintaan ke server dibatalkan.';
        break;
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case 401:
            message = 'Permintaan tidak terautentikasi.';
            break;
          case 403:
            message = 'Permintaan tidak terautorisasi.';
            break;
          case 404:
            message = 'Permintaan tidak ditemukan.';
            break;
          case 500:
            message = 'Terdapat kesalahan pada server.';
            break;
          case 503:
            message = 'Server sedang dalam pemeliharaan.';
            break;
          default:
            message = error.message;
            break;
        }
        break;
      case DioErrorType.other:
        message = error.message;
        break;
    }

    return CustomException(
      message: message,
      code: error.response?.statusCode ?? 0,
    );
  }
}
