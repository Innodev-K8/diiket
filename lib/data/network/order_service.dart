import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderServiceProvider = StateProvider<OrderService>((ref) {
  final Market currentMarket = ref.watch(currentMarketProvider).state;

  return OrderService(ref.read(apiProvider), currentMarket.id ?? 1);
});

class OrderService {
  Dio _dio;
  int _marketId;

  OrderService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/${_marketId}/orders/$path';

  Future<Order?> getActiveOrder() async {
    try {
      final response = await _dio.get(_('active'));

      return Order.fromJson(response.data['data']);
    } on DioError catch (error) {
      if (error.response?.statusCode == 404) {
        return null;
      }

      throw CustomException.fromDioError(error);
    }
  }

  Future<OrderItem> placeOrderItem(Product product, int quantity,
      [String? notes]) async {
    try {
      Map<String, dynamic> data = {
        'product_id': product.id,
        'quantity': quantity,
        if (notes != null) 'notes': notes,
      };

      final response = await _dio.post(
        _('items'),
        data: data,
      );

      return OrderItem.fromJson(response.data['data']);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<OrderItem> updateOrderItem(
    OrderItem orderItem, {
    int? quantity,
    String? notes,
  }) async {
    try {
      Map<String, dynamic> data = {
        '_method': 'PATCH',
        if (quantity != null) 'quantity': quantity,
        if (notes != null) 'notes': notes,
      };

      final response = await _dio.post(
        _('items/${orderItem.id}'),
        data: data,
      );

      return OrderItem.fromJson(response.data['data']);
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }
}
