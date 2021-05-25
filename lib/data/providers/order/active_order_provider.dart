import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/network/order_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final activeOrderProvider =
    StateNotifierProvider<ActiveOrderState, AsyncValue<Order?>>((ref) {
  return ActiveOrderState(ref.watch(orderServiceProvider).state);
});

class ActiveOrderState extends StateNotifier<AsyncValue<Order?>> {
  OrderService _orderService;

  ActiveOrderState(this._orderService) : super(AsyncValue.loading()) {
    retrieveActiveOrder();
  }

  Future<void> retrieveActiveOrder() async {
    try {
      Order? order = await _orderService.getActiveOrder();

      state = AsyncValue.data(order);
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }

  Future<void> placeOrderItem(Product product, int quantity,
      [String? notes]) async {
    try {
      OrderItem orderItem =
          await _orderService.placeOrderItem(product, quantity, notes);

      Order? activeOrder = state.maybeWhen(orElse: () => null);

      if (activeOrder != null) {
        state = AsyncValue.data(
          activeOrder.copyWith(
            order_items: [
              ...?activeOrder.order_items,
              orderItem,
            ],
          ),
        );
      } else {
        await retrieveActiveOrder();
      }
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }

  Future<void> updateOrderItem(
    OrderItem orderItem, {
    int? quantity,
    String? notes,
  }) async {
    try {
      OrderItem updatedOrderItem = await _orderService.updateOrderItem(
        orderItem,
        quantity: quantity,
        notes: notes,
      );

      Order? activeOrder = state.maybeWhen(orElse: () => null);

      if (activeOrder != null) {
        state = AsyncValue.data(
          activeOrder.copyWith(
            order_items: activeOrder.order_items?.map((item) {
              if (updatedOrderItem.id == item.id) {
                return updatedOrderItem;
              } else {
                return item;
              }
            }).toList(),
          ),
        );
      } else {
        await retrieveActiveOrder();
      }
    } on CustomException catch (error) {
      state = AsyncValue.error(error);
    }
  }

  bool isProductInOrder(Product product) {
    List<Product> orderProducts = state.data?.value?.order_items
            ?.map((OrderItem item) => item.product!)
            .toList() ??
        [];

    return orderProducts.contains(product);
  }
}
