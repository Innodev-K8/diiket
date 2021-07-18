import 'package:diiket/data/models/delivery_detail.dart';
import 'package:diiket/data/models/directions.dart';
import 'package:diiket/data/models/fee.dart';
import 'package:diiket/data/network/fee_service.dart';
import 'package:diiket/data/providers/global_exception_provider.dart';
import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deliveryDetailProvider =
    StateNotifierProvider<DeliveryDetailState, DeliveryDetail>((ref) {
  return DeliveryDetailState(ref.read);
});

class DeliveryDetailState extends StateNotifier<DeliveryDetail> {
  final Reader _read;

  DeliveryDetailState(this._read) : super(DeliveryDetail()) {
    _read(activeOrderProvider.notifier).addListener((state) {
      if (state != null) calculateFee();
    });
  }

  void setDeliveryAddress([String address = '']) {
    state = state.copyWith(
      address: address,
    );
  }

  Future<void> calculateFee() async {
    if (state.directions?.totalDistance == null) return;

    try {
      state = state.copyWith(
        fee: const AsyncValue.loading(),
      );

      final Fee fee = await _read(feeServiceProvider).calculate(
        state.directions?.totalDistance ?? 0,
        _read(activeOrderProvider.notifier).totalProductWeight,
      );

      state = state.copyWith(
        fee: AsyncValue.data(fee),
      );
    } on Exception catch (e, st) {
      _read(exceptionProvider.notifier).setError(e, st);
    }
  }

  void setDeliveryDirections(LatLng? position, Directions? directions) {
    final placeMark = directions?.placemark;

    final String? subLocality = placeMark?.subLocality;
    final String? locality = placeMark?.locality;
    final String? administrativeArea = placeMark?.administrativeArea;
    final String? postalCode = placeMark?.postalCode;

    final String address =
        "${subLocality ?? '-'}, ${locality ?? '-'}, ${administrativeArea ?? '-'} ${postalCode ?? '-'}";

    state = state.copyWith(
      position: position,
      directions: directions,
      geocodedPosition: address,
    );
  }
}
