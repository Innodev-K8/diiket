import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/paginated/paginated_products.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api_service.dart';

final productServiceProvider = StateProvider<ProductService>((ref) {
  final Market currentMarket = ref.watch(currentMarketProvider).state;

  return ProductService(ref.read(apiProvider), currentMarket.id ?? 1);
});

class ProductService {
  final Dio _dio;
  final int _marketId;

  ProductService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/$_marketId/products/$path';

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

      return PaginatedProducts.fromJson(castOrFallback(response.data, {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<PaginatedProducts> searchProducs([int page = 1, String? query]) async {
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
