import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final fareServiceProvider = Provider<FareService>((ref) {
  return FareService(ref.read(apiProvider));
});

class FareService {
  final Dio _dio;

  FareService(this._dio);

  String _(Object path) => '/fare/$path';

  Future<Fare> calculate(int distance, int weight) async {
    try {
      final response = await _dio.get(
        _('calculate'),
        queryParameters: {
          'distance': distance,
          'payload_weight': weight,
        },
      );

      return Fare.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
