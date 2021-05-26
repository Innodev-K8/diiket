import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/paginated/paginated_products.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final productServiceProvider = StateProvider<ProductService>((ref) {
  final Market currentMarket = ref.watch(currentMarketProvider).state;

  return ProductService(ref.read(apiProvider), currentMarket.id ?? 1);
});

class ProductService {
  Dio _dio;
  int _marketId;

  ProductService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/${_marketId}/products/$path';

  Future<PaginatedProducts> getAllProducts(
      [int page = 1, String? category]) async {
    try {
      final response = await _dio.get(
        _(''),
        queryParameters: {
          'page': page,
          if (category != null) 'category': category,
        },
      );

      return PaginatedProducts.fromJson(response.data);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<PaginatedProducts> getPopularProducts([int page = 1]) async {
    try {
      final response = await _dio.get(
        _('popular'),
        queryParameters: {
          'page': page,
        },
      );

      return PaginatedProducts.fromJson(response.data);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<PaginatedProducts> getRandomProducts([int page = 1]) async {
    try {
      final response = await _dio.get(
        _('random'),
        queryParameters: {
          'page': page,
        },
      );

      return PaginatedProducts.fromJson(response.data);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
