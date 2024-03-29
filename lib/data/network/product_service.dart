import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final productServiceProvider = StateProvider<ProductService>((ref) {
  final Market? currentMarket = ref.watch(currentMarketProvider).state;

  return ProductService(ref.read(apiProvider), currentMarket?.id);
});

class ProductService {
  final Dio _dio;
  final int? _marketId;

  ProductService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/$_marketId/products/$path';

  Future<PaginatedProducts> getAllProducts({
    int page = 1,
    String? category,
    int? randomSeed,
  }) async {
    try {
      if (_marketId == null) {
        return PaginatedProducts.fromJson({});
      }

      final response = await _dio.get(
        _(''),
        queryParameters: {
          'page': page,
          if (category != null) 'category': category,
          if (randomSeed != null) 'random_seed': randomSeed,
        },
      );

      return PaginatedProducts.fromJson(castOrFallback(response.data, {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<PaginatedProducts> searchProducs([int page = 1, String? query]) async {
    if (_marketId == null) {
      return PaginatedProducts.fromJson({});
    }

    try {
      final response = await _dio.get(
        _(''),
        queryParameters: {
          'page': page,
          if (query != null && query != '') 'q': query,
        },
      );

      return PaginatedProducts.fromJson(castOrFallback(response.data, {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  // Product section endpoint: /user/markets/$_marketId/products/${section}
  Future<PaginatedProducts> getProductSection(String section,
      [int page = 1]) async {
    if (_marketId == null) {
      return PaginatedProducts.fromJson({});
    }

    try {
      final response = await _dio.get(
        _(section),
        queryParameters: {
          'page': page,
        },
      );

      return PaginatedProducts.fromJson(castOrFallback(response.data, {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

// Product scenario endpoint: /user/markets/$_marketId/products/scenario/${scenario}
  Future<PaginatedProducts> getProductScenario(String scenario,
      [int page = 1, int? limit]) async {
    if (_marketId == null) {
      return PaginatedProducts.fromJson({});
    }

    try {
      final response = await _dio.get(
        _('scenario/$scenario'),
        queryParameters: {
          'page': page,
          if (limit != null) 'limit': limit,
        },
      );

      return PaginatedProducts.fromJson(castOrFallback(response.data, {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
