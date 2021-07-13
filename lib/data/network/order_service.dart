import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderServiceProvider = StateProvider<OrderService>((ref) {
  // rebuild order service whenever user state changes
  ref.watch(authProvider);

  final Market currentMarket = ref.watch(currentMarketProvider).state;

  return OrderService(ref.read(apiProvider), currentMarket.id ?? 1);
});

class OrderService {
  final Dio _dio;
  final int _marketId;

  OrderService(this._dio, this._marketId);

  String _(Object path) => '/user/markets/$_marketId/orders/$path';

  Future<Order?> getActiveOrder() async {
    try {
      final response = await _dio.get(_('active'));

      return Order.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      // 404 berarti ndak ada active order
      if (error.response?.statusCode == 404) {
        return null;
      }

      throw CustomException.fromDioError(error);
    }
  }

  Future<void> cancelActiveOrder() async {
    try {
      await _dio.post(_('active/cancel'));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<Order?> confirmActiveOrder(
    LatLng location,
    Fare fare,
    String? address,
    String? notificationToken,
  ) async {
    try {
      final Map<String, dynamic> data = {
        'location_lat': location.latitude.toString(),
        'location_lng': location.longitude.toString(),
        'delivery_fee': fare.delivery_fee,
        'pickup_fee': fare.pickup_fee,
        'service_fee': fare.service_fee,
        if (notificationToken != null)
          'user_notification_token': notificationToken,
        if (address != null) 'address': address,
      };

      final response = await _dio.post(
        _('active/confirm'),
        data: data,
      );

      return Order.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      if (error.response?.statusCode == 422) {
        final List<dynamic>? results = castOrNull(error.response?.data['data']);

        if (results == null) {
          throw CustomException(
            message: castOrFallback(
              error.response?.data['message'],
              error.message,
            ),
          );
        }

        final List<OrderItem> outOfStockItems = results
            .map(
              (json) => OrderItem.fromJson(castOrFallback(json, {})),
            )
            .toList();

        throw CustomException(
          message:
              'Terdapat barang yang habis persediaan:\n\n${outOfStockItems.map(
                    (e) =>
                        '${e.product?.name} (tersedia ${e.product?.stocks} ${e.product?.quantity_unit})',
                  ).join('\n')}',
        );
      }

      throw CustomException.fromDioError(error);
    }
  }

  Future<OrderItem> placeOrderItem(Product product, int quantity,
      [String? notes]) async {
    try {
      final Map<String, dynamic> data = {
        'product_id': product.id,
        'quantity': quantity,
        if (notes != null) 'notes': notes,
      };

      final response = await _dio.post(
        _('items'),
        data: data,
      );

      return OrderItem.fromJson(castOrFallback(response.data['data'], {}));
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
      final Map<String, dynamic> data = {
        '_method': 'PATCH',
        if (quantity != null) 'quantity': quantity,
        if (notes != null) 'notes': notes,
      };

      final response = await _dio.post(
        _('items/${orderItem.id}'),
        data: data,
      );

      return OrderItem.fromJson(castOrFallback(response.data['data'], {}));
    } on DioError catch (error) {
      throw CustomException.fromDioError(error);
    }
  }

  Future<void> deleteOrderItem(OrderItem orderItem) async {
    try {
      await _dio.delete(_('items/${orderItem.id}'));
    } on DioError catch (error) {
      // 404 berarti ndak ada itemnya
      if (error.response?.statusCode == 404) {
        return;
      }

      // ini buat ngehandle server yang ngawur, sukses kok 403
      if (error.response?.statusCode == 403) {
        return;
      }

      throw CustomException.fromDioError(error);
    }
  }
}
