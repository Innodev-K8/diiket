import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/data/network/market_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Dio dio;
  late MarketService marketService;

  setUp(() {
    dio = ApiService.create();
    marketService = MarketService(dio);
  });

  test('Market Service should get a list of nearby markets', () async {
    final result = await marketService.getNearbyMarket();

    expect(result, isNotEmpty);
    expect(result, isA<List<Market>>());
  });

  test('Market Service should market detail', () async {
    final result = await marketService.getMarketDetail(1);

    expect(result, isNotNull);
    expect(result, isA<Market>());
  });
}
