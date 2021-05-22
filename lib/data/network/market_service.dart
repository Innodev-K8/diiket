import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:dio/dio.dart';

class MarketService {
  Dio _dio;

  MarketService(this._dio);

  String _(Object path) => '/user/markets/$path';

  Future<List<Market>> getNearbyMarket() async {
    try {
      final response = await _dio.get(_('nearby'));

      List<dynamic> results = response.data['data'];

      return results.map((json) => Market.fromJson(json)).toList();
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<Market> getMarketDetail(int id) async {
    try {
      final response = await _dio.get(_(id));

      return Market.fromJson(response.data['data']);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
