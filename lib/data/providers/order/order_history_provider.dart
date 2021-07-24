import 'package:diiket/data/custom_exception.dart';
import 'package:diiket/data/models/order.dart';
import 'package:diiket/data/network/order_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderHistoryProvider =
    StateNotifierProvider<OrderHistoryState, AsyncValue<List<Order>>>((ref) {
  return OrderHistoryState(ref.read);
});

class OrderHistoryState extends StateNotifier<AsyncValue<List<Order>>> {
  final Reader _read;

  OrderHistoryState(this._read) : super(AsyncValue.loading()) {
    retrieveOrderHistory();
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
