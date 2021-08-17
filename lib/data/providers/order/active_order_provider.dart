import 'dart:convert';

import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/delivery_detail.dart';
import 'package:diiket/data/models/fee.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/models/user.dart';
import 'package:diiket/data/network/order_service.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/data/providers/order/order_history_provider.dart';
import 'package:diiket/data/providers/pusher_provider.dart';
import 'package:diiket/helpers/casting_helper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusher_client/pusher_client.dart';

final activeOrderProvider = StateNotifierProvider<ActiveOrderState, Order?>(
  (ref) {
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
  final PusherClient _pusher;
  final Reader _read;

  Channel? _channel;

  ActiveOrderState(this._pusher, this._read) : super(null) {
    retrieveActiveOrder();

    _read(authProvider.notifier).addListener(
      (User? user) {
        if (user == null && state != null) {
          state = null;

          return;
        }

        // refresh order if user changed
        if (user?.id != state?.id) {
          retrieveActiveOrder();
        }
      },
      fireImmediately: false,
    );
  }

  //#region EVENT-LISTENERS
  Future<void> connectToPusher(Order order) async {
    if (!order.isProcessing) return;

    try {
      await _pusher.connect();

      _channel = _pusher.subscribe(
        'market.${order.market_id}.orders.${order.id}',
      );

      _channel!.bind('order-status-updated', _onOrderStatusUpdated);
    } catch (_) {}
  }

  void _onOrderStatusUpdated(PusherEvent? event) {
    final dynamic response = jsonDecode(event?.data ?? '');

    if (response['order'] == null) return;

    final Order order = Order.fromJson(
      castOrFallback(response['order'], {}),
    );

    if (order.isProcessing || order.status == 'unconfirmed') {
      // reload to get all the relations
      retrieveActiveOrder();
    } else {
      disconnectFromPusher(order);
      state = null;

      if (order.status == 'completed') {
        _read(orderHistoryProvider.notifier).retrieveOrderHistory();
      }

      if (['unconfirmed', 'completed'].contains(order.status)) {
        // TODO: uncomment this
        // _read(orderChatChannelProvider.notifier).disconnect();
      }
    }
  }

  Future<void> disconnectFromPusher(Order order) async {
    await _channel?.unbind('order-status-updated');
    await _pusher.unsubscribe(
      'market.${order.market_id}.orders.${order.id}',
    );
    await _pusher.disconnect();
  }

  @override
  Future<void> dispose() async {
    try {
      if (state != null) {
        await disconnectFromPusher(state!);
      }
    } catch (_) {} finally {
      super.dispose();
    }
  }
  //#endregion

  Future<void> retrieveActiveOrder() async {
    try {
      if (mounted && _read(authProvider) != null) {
        final Order? oldOrder = state;

        final Order? newOrder =
            await _read(orderServiceProvider).state.getActiveOrder();

        // connect to pusher if newOrder is not null and isProcessing
        if (newOrder != null && newOrder.isProcessing) {
          await connectToPusher(newOrder);
        } else if (oldOrder != null) {
          await disconnectFromPusher(oldOrder);
        }

        state = newOrder;
      }
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> cancelActiveOrder() async {
    try {
      if (state != null) {
        await disconnectFromPusher(state!);
      }

      await _read(orderServiceProvider).state.cancelActiveOrder();
      await retrieveActiveOrder();
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> confirmActiveOrder({
    required DeliveryDetail deliveryDetail,
    required Fee fee,
    String? notificationToken,
    // dipanggil sebelum ngubah state, biar bisa nampilin alert sebelum OrderStateWrapper ganti state
    Function? onConfirmed,
  }) async {
    try {
      if (!mounted) return;

      final Order? result =
          await _read(orderServiceProvider).state.confirmActiveOrder(
                deliveryDetail: deliveryDetail,
                fee: fee,
                notificationToken: notificationToken,
              );

      if (result == null) return;

      await onConfirmed?.call();

      state = result;

      // just to make sure whenever driver confirm this order before the user calls onConfirmed.
      await retrieveActiveOrder();
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> placeOrderItem(Product product, int quantity,
      [String? notes]) async {
    try {
      final OrderItem orderItem = await _read(orderServiceProvider)
          .state
          .placeOrderItem(product, quantity, notes);

      final Order? activeOrder = state;

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

      final Order? activeOrder = state;

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
      final Order? activeOrder = state;

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
      final OrderItem? orderItem = getOrderItemByProduct(product);

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
      final OrderItem? orderItem = getOrderItemByProduct(product);

      if (orderItem == null) return;

      await deleteOrderItem(orderItem);
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  OrderItem? getOrderItemByProduct(Product product) {
    final List<OrderItem> orderProducts = state?.order_items
            ?.where((OrderItem item) => item.product?.id == product.id)
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

    for (final OrderItem item in castOrFallback(state?.order_items, [])) {
      sum += item.quantity ?? 0;
    }

    return sum;
  }

  int get totalProductPrice {
    // sebenernya di model Order udah ada, tapi ini karena update sendiri, harus gini
    int sum = 0;

    for (final OrderItem item in castOrFallback(state?.order_items, [])) {
      final int price = item.product?.price ?? 0;
      final int quantity = item.quantity ?? 0;

      sum += price * quantity;
    }

    return sum;
  }

  int get totalProductWeight {
    // sebenernya di model Order udah ada, tapi ini karena update sendiri, harus gini
    int sum = 0;

    for (final OrderItem item in castOrFallback(state?.order_items, [])) {
      final int weight = item.product?.weight ?? 0;
      final int quantity = item.quantity ?? 0;

      sum += weight * quantity;
    }

    return sum;
  }
}
