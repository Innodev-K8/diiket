import 'package:diiket/data/network/fee_service.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/delivery_detail_provider.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final activeOrderFeeProvider =
    StateNotifierProvider<ActiveOrderFeeNotifier, AsyncValue<Fee?>>((ref) {
  return ActiveOrderFeeNotifier(ref.read);
});

class ActiveOrderFeeNotifier extends StateNotifier<AsyncValue<Fee?>> {
  final Reader _read;

  ActiveOrderFeeNotifier(this._read) : super(const AsyncValue.loading()) {
    // init call
    onOrderOrDetailChanged(null);

    // listen whenever order or delivery  detail changes
    _read(activeOrderProvider.notifier).addListener(onOrderOrDetailChanged);
    _read(deliveryDetailProvider).addListener(onOrderOrDetailChanged);
  }

  void onOrderOrDetailChanged(_) {
    final activeOrder = _read(activeOrderProvider);
    final deliveryDetail = _read(deliveryDetailProvider).state;

    if (activeOrder != null && deliveryDetail != null) {
      calculateFromDeliveryDetail(deliveryDetail);
    } else {
      state = AsyncValue.data(null);
    }
  }

  Future<void> calculateFromDeliveryDetail(DeliveryDetail detail) async {
    if (detail.directions?.totalDistance == null) return;

    try {
      final feeService = _read(feeServiceProvider);
      final activeOrderNotifier = _read(activeOrderProvider.notifier);

      state = const AsyncValue.loading();

      final Fee fee = await feeService.calculate(
        detail.directions?.totalDistance ?? 0,
        activeOrderNotifier.totalProductWeight,
      );

      state = AsyncValue.data(fee);
    } on Exception catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
