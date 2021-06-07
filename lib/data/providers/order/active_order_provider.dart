import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/network/order_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final activeOrderProvider = StateNotifierProvider<ActiveOrderState, Order?>(
  (ref) {
    // orderServiceProvider already watching market and auth state
    return ActiveOrderState(ref.watch(orderServiceProvider).state, ref.read);
  },
);

final activeOrderErrorProvider = StateProvider<CustomException?>((ref) {
  return null;
});

// CATATANN! KATA 'ORDER' DI SINI BUKAN BERARTI URUTAN, NAMUN PESANAN
// CONTOHNYA isProductInOrder BUKAN BERARTI product SUDAH URUT, NAMUN APAKAH
// PRODUK ADA DALAM PESANAN

class ActiveOrderState extends StateNotifier<Order?> {
  OrderService _orderService;
  Reader _read;

  ActiveOrderState(this._orderService, this._read) : super(null) {
    retrieveActiveOrder();
  }

  Future<void> retrieveActiveOrder() async {
    try {
      if (mounted) state = await _orderService.getActiveOrder();
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> cancelActiveOrder() async {
    try {
      await _orderService.cancelActiveOrder();
      await retrieveActiveOrder();
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
    }
  }

  Future<void> confirmActiveOrder(LatLng location, Fare fare,
      [String? address]) async {
    try {
      if (mounted)
        state = await _orderService.confirmActiveOrder(location, fare, address);
    } on CustomException catch (error) {
      _read(activeOrderErrorProvider).state = error;
      throw error;
    }
  }

  Future<void> placeOrderItem(Product product, int quantity,
      [String? notes]) async {
    try {
      OrderItem orderItem =
          await _orderService.placeOrderItem(product, quantity, notes);

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

      await _orderService.updateOrderItem(
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

      await _orderService.deleteOrderItem(orderItem);

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
