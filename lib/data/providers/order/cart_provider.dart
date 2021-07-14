import 'dart:async';

import 'package:diiket/data/models/order_item.dart';
import 'package:diiket/data/models/product.dart';
import 'package:diiket/data/providers/market_provider.dart';
import 'package:diiket/data/repositories/cart_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final activeCartFamilyProvider =
    StateProvider<StateNotifierProvider<CartState, List<OrderItem>>>((ref) {
  final market = ref.watch(currentMarketProvider).state;

  return cartProviderFamily(market.id ?? 0);
});

final activeCartProviderNotifier =
    StateProvider<StateNotifierProvider<CartState, List<OrderItem>>>((ref) {
  final market = ref.watch(currentMarketProvider).state;

  return cartProviderFamily(market.id ?? 0);
});

final cartProviderFamily =
    StateNotifierProvider.family<CartState, List<OrderItem>, int?>(
        (ref, marketId) {
  return CartState(ref.read, marketId ?? 0);
});

class CartState extends StateNotifier<List<OrderItem>> {
  final Reader _read;
  final int _marketId;

  StreamSubscription? _subscription;

  CartState(this._read, this._marketId) : super([]) {
    final repository = _read(cartRepositoryProvider).state;

    _subscription = repository.cartStream(_marketId).listen((items) {
      state = items;
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void addItem(Product product, int quantity, [String? notes]) {
    final repository = _read(cartRepositoryProvider).state;

    repository.addItem(
      _marketId,
      OrderItem(
        product: product,
        quantity: quantity,
        notes: notes,
      ),
    );
  }

  void updateItem(
    OrderItem orderItem, {
    int? quantity,
    String? notes,
  }) {
    final repository = _read(cartRepositoryProvider).state;

    // check if firebase_cart_id is set
    if (orderItem.firebase_cart_id == null) return;

    repository.updateItem(
      _marketId,
      orderItem.firebase_cart_id!,
      notes: notes,
      quantity: quantity,
    );
  }

  void deleteItem(OrderItem orderItem) {
    final repository = _read(cartRepositoryProvider).state;

    // check if firebase_cart_id is set
    if (orderItem.firebase_cart_id == null) return;

    repository.removeItem(
      _marketId,
      orderItem.firebase_cart_id!,
    );
  }

  OrderItem? getOrderItemByProduct(Product product) {
    final List<OrderItem> orderProducts = state
        .where((OrderItem item) => item.product?.id == product.id)
        .toList();

    return orderProducts.isNotEmpty ? orderProducts.first : null;
  }

  bool isProductInOrder(Product product) {
    return getOrderItemByProduct(product) != null;
  }
}
