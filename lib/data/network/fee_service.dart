import 'package:diiket_core/diiket_core.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final feeServiceProvider = Provider<FeeService>((ref) {
  return FeeService(ref.read(apiProvider));
});

class FeeService {
  final Dio _dio;

  FeeService(this._dio);

  String _(Object path) => '/fee/$path';

  Future<Fee> calculate(int distance, int weight) async {
    try {
      final response = await _dio.get(
        _('calculate'),
        queryParameters: {
          'distance': distance,
          'payload_weight': weight,
        },
      );

      return Fee.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
