import 'package:dio/src/dio_error.dart';

class CustomException implements Exception {
  final String? message;

  const CustomException({this.message = 'Terjadi kesalahan!'});

  @override
  String toString() {
    return "CustomException { message: $message }";
  }

  factory CustomException.fromDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return CustomException(message: 'Waktu koneksi ke server habis.');
      case DioErrorType.sendTimeout:
        return CustomException(message: 'Waktu koneksi ke server habis.');
      case DioErrorType.receiveTimeout:
        return CustomException(message: 'Waktu koneksi ke server habis.');
      case DioErrorType.cancel:
        return CustomException(message: 'Permintaan ke server dibatalkan.');
      case DioErrorType.response:
        switch (error.response!.statusCode) {
          case 401:
            return CustomException(message: 'Permintaan tidak terautentikasi.');
          case 403:
            return CustomException(message: 'Permintaan tidak terautorisasi.');
          case 404:
            return CustomException(message: 'Permintaan tidak ditemukan.');
          case 500:
            return CustomException(message: 'Terdapat kesalahan pada server.');
          case 503:
            return CustomException(
              message: 'Server sedang dalam pemeliharaan.',
            );
          default:
            return CustomException(
              message: error.message,
            );
        }
      case DioErrorType.other:
        return CustomException(
          message: error.message,
        );
    }
  }
}
