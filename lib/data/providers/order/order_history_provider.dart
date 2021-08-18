import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/network/order_service.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryState, AsyncValue<List<Order>>>((ref) {
  return OrderHistoryState(ref.read);
});

class OrderHistoryState extends StateNotifier<AsyncValue<List<Order>>> {
  final Reader _read;

  OrderHistoryState(this._read) : super(const AsyncValue.loading()) {
    _read(authProvider.notifier).addListener((user) {
      if (user == null) {
        state = AsyncValue.data(List<Order>.empty());

        return;
      }

      retrieveOrderHistory();
    });
  }

  Future<void> retrieveOrderHistory() async {
    try {
      state = AsyncValue.data(
        await _read(orderServiceProvider).state.getOrderHistory(),
      );
    } on CustomException catch (exception) {
      state = AsyncValue.error(exception);
    }
  }
}
