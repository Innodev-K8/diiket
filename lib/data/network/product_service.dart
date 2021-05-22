import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  final Market currentMarket = ref.watch(currentMarketProvider).state;

  return ProductService(ref.read(apiProvider), currentMarket.id ?? 1);
});

class ProductService {
  Dio _dio;
  int _marketId;

  ProductService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/${_marketId}/$path';

  Future<List<Product>> getAllProducts() async {
    try {
      final response = await _dio.get(_('products'));

      List<dynamic> results = response.data['data'];

      return results.map((json) => Product.fromJson(json)).toList();
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  // TODO: add getPopularProducts, etc...
}
