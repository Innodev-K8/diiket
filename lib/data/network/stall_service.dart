import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final stallServiceProvider = StateProvider<StallService>((ref) {
  final Market? currentMarket = ref.watch(currentMarketProvider).state;

  return StallService(ref.read(apiProvider), currentMarket?.id);
});

class StallService {
  final Dio _dio;
  final int? _marketId;

  StallService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/$_marketId/stalls/$path';

  Future<PaginatedStalls> getStalls([int page = 1]) async {
    if (_marketId == null) {
      return PaginatedStalls.fromJson({});
    }

    try {
      final response = await _dio.get(
        _(''),
        queryParameters: {
          'page': page,
        },
      );

      return PaginatedStalls.fromJson(castOrFallback(response.data, {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<Stall> getStallDetail(int id) async {
    if (_marketId == null) {
      return Stall.fromJson({});
    }

    try {
      final response = await _dio.get(_(id));

      return Stall.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
