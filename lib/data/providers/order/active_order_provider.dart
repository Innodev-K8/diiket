import 'dart:convert';

import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/network/order_service.dart';
import 'package:diiket/data/providers/pusher_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusher_client/pusher_client.dart';

final activeOrderProvider = StateNotifierProvider<ActiveOrderState, Order?>(
  (ref) {
    // orderServiceProvider already watching market and auth state
    final state = ActiveOrderState(
      ref.read(pusherProvider),
      ref.read,
    );

    ref.onDispose(() {
      state.dispose();
    });

    return state;
  },
);

final activeOrderErrorProvider = StateProvider<CustomException?>((ref) {
  return null;
});

// CATATANN! KATA 'ORDER' DI SINI BUKAN BERARTI URUTAN, NAMUN PESANAN
// CONTOHNYA isProductInOrder BUKAN BERARTI product SUDAH URUT, NAMUN APAKAH
// PRODUK ADA DALAM PESANAN

class ActiveOrderState extends StateNotifier<Order?> {
  PusherClient _pusher;
  // OrderService _read(orderServiceProvider).state;
  Reader _read;

  Channel? _channel;

  ActiveOrderState(this._pusher, this._read) : super(null) {
    retrieveActiveOrder().then((value) => initPusher());
  }

  //#region EVENT-LISTENERS
  Future<void> initPusher() async {
    try {
      await _pusher.connect();
      await updateSubscription();
    } catch (_) {}
  }

  Future<void> updateSubscription() async {
    if (state?.id == null) return;

    try {
      await _unsubscribe();

      print('Subscribing to active order channel');
      _channel = _pusher.subscribe('orders.${state!.id}');

      _channel!.bind('order-status-updated', (PusherEvent? event) {
        dynamic response = jsonDecode(event?.data ?? '');

        if (response['order'] == null) return;

        Order order = Order.fromJson(response['order']);

        if (order.status == 'completed' || order.status == 'canceled') {
          _unsubscribe(order.id);
          state = null;
        } else {
          state = order;
        }
      });
    } catch (_) {}
  }

  Future<void> _unsubscribe([int? id]) async {
    await _channel?.unbind('order-status-updated');
    await _pusher.unsubscribe('orders.${id ?? state?.id}');
  }

  @override
  Future<void> dispose() async {
    try {
      await _unsubscribe();
      await _pusher.disconnect();
    } catch (_) {} finally {
      super.dispose();
    }
  }
  //#endregion

  Future<void> retrieveActiveOrder() async {
    try {
      if (mounted) {
        state = await _read(orderServiceProvider).state.getActiveOrder();
      }
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> cancelActiveOrder() async {
    try {
      await _unsubscribe();
      await _read(orderServiceProvider).state.cancelActiveOrder();
      await retrieveActiveOrder();
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> confirmActiveOrder(
    LatLng location,
    Fare fare,
    String? address,
    String? notificationToken,
  ) async {
    try {
      if (mounted) {
        state = await _read(orderServiceProvider).state.confirmActiveOrder(
              location,
              fare,
              address,
              notificationToken,
            );

        // re-subscribe
        updateSubscription();
      }
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
      throw error;
    }
  }

  Future<void> placeOrderItem(Product product, int quantity,
      [String? notes]) async {
    try {
      OrderItem orderItem = await _read(orderServiceProvider)
          .state
          .placeOrderItem(product, quantity, notes);

      Order? activeOrder = state;

      if (activeOrder != null) {
        state = activeOrder.copyWith(
          order_items: [
            ...?activeOrder.order_items,
            orderItem,
          ],
        );
      } else {
        await retrieveActiveOrder();
      }
    } on CustomException catch (error) {
      // ignore if item already in order list
      if (error.code == 403) return;

      await retrieveActiveOrder();
    }
  }

  Future<void> updateOrderItem(
    OrderItem orderItem, {
    int? quantity,
    String? notes,
  }) async {
    try {
      final updatedOrderItem = orderItem.copyWith(
        quantity: quantity ?? orderItem.quantity,
        notes: notes ?? orderItem.notes,
      );

      Order? activeOrder = state;

      if (activeOrder != null) {
        // change current state biar kenceng nggak nunggu network request
        state = activeOrder.copyWith(
          order_items: activeOrder.order_items?.map((item) {
            if (updatedOrderItem.id == item.id) {
              return updatedOrderItem;
            } else {
              return item;
            }
          }).toList(),
        );
      }

      await _read(orderServiceProvider).state.updateOrderItem(
            orderItem,
            quantity: quantity,
            notes: notes,
          );

      if (activeOrder == null) {
        await retrieveActiveOrder();
      }
    } on CustomException catch (_) {
      await retrieveActiveOrder();
    }
  }

  Future<void> deleteOrderItem(OrderItem orderItem) async {
    try {
      Order? activeOrder = state;

      if (activeOrder != null) {
        // change current state biar kenceng nggak nunggu network request
        state = activeOrder.copyWith(
          order_items: activeOrder.order_items
            ?..removeWhere((item) => item.id == orderItem.id),
        );

        if (state!.order_items!.isEmpty) {
          state = null;
        }
      }

      await _read(orderServiceProvider).state.deleteOrderItem(orderItem);

      if (activeOrder == null) {
        await retrieveActiveOrder();
      }
    } on CustomException catch (_) {
      await retrieveActiveOrder();
    }
  }

  Future<void> updateOrderItemByProduct(
    Product product, {
    int? quantity,
    String? notes,
  }) async {
    try {
      OrderItem? orderItem = getOrderItemByProduct(product);

      if (orderItem == null) return;

      await updateOrderItem(
        orderItem,
        quantity: quantity,
        notes: notes,
      );
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> deleteOrderItemByProduct(Product product) async {
    try {
      OrderItem? orderItem = getOrderItemByProduct(product);

      if (orderItem == null) return;

      await deleteOrderItem(orderItem);
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  OrderItem? getOrderItemByProduct(Product product) {
    List<OrderItem> orderProducts = state?.order_items
            ?.where((OrderItem item) => item.product?.id! == product.id!)
            .toList() ??
        [];

    return orderProducts.isNotEmpty ? orderProducts.first : null;
  }

  bool isProductInOrder(Product product) {
    return getOrderItemByProduct(product) != null;
  }

  // some useful getters
  int get orderCount {
    int sum = 0;

    state?.order_items?.forEach((item) => sum += item.quantity ?? 0);

    return sum;
  }

  int get totalProductPrice {
    // sebenernya di model Order udah ada, tapi ini karena update sendiri, harus gini
    int sum = 0;

    state?.order_items?.forEach((item) {
      final int price = item.product?.price ?? 0;
      final int quantity = item.quantity ?? 0;

      sum += price * quantity;
    });

    return sum;
  }

  int get totalProductWeight {
    // sebenernya di model Order udah ada, tapi ini karena update sendiri, harus gini
    int sum = 0;

    state?.order_items?.forEach((item) {
      final int weight = item.product?.weight ?? 0;
      final int quantity = item.quantity ?? 0;

      sum += weight * quantity;
    });

    return sum;
  }
}
