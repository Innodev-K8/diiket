import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/paginated/paginated_stalls.dart';
import 'package:diiket/data/models/stall.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final stallServiceProvider = StateProvider<StallService>((ref) {
  final Market currentMarket = ref.watch(currentMarketProvider).state;

  return StallService(ref.read(apiProvider), currentMarket.id ?? 1);
});

class StallService {
  Dio _dio;
  int _marketId;

  StallService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/${_marketId}/stalls/$path';

  Future<PaginatedStalls> getStalls([int page = 1]) async {
    try {
      final response = await _dio.get(
        _(''),
        queryParameters: {
          'page': page,
        },
      );

      return PaginatedStalls.fromJson(response.data);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<Stall> getStallDetail(int id) async {
    try {
      final response = await _dio.get(_(id));

      return Stall.fromJson(response.data['data']);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
