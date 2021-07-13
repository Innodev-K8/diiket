import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final marketServiceProvider = Provider<MarketService>((ref) {
  return MarketService(ref.read(apiProvider));
});

class MarketService {
  final Dio _dio;

  MarketService(this._dio);

  String _(Object path) => '/user/markets/$path';

  Future<List<Market>> getNearbyMarket() async {
    try {
      final response = await _dio.get(_('nearby'));

      final List<dynamic> results = castOrFallback(response.data['data'], []);

      return results
          .map((json) => Market.fromJson(castOrFallback(json, {})))
          .toList();
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<Market> getMarketDetail(int id) async {
    try {
      final response = await _dio.get(_(id));

      return Market.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
