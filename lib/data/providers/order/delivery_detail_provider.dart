import 'package:diiket/data/models/delivery_detail.dart';
import 'package:diiket/data/models/directions.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:diiket/data/network/fare_service.dart';
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
      if (state != null) calculateFare();
    });
  }

  void setDeliveryAddress([String address = '']) {
    state = state.copyWith(
      address: address,
    );
  }

  Future<void> calculateFare() async {
    if (state.directions?.totalDistance == null) return;

    state = state.copyWith(
      fare: const AsyncValue.loading(),
    );

    final Fare fare = await _read(fareServiceProvider).calculate(
      state.directions?.totalDistance ?? 0,
      _read(activeOrderProvider.notifier).totalProductWeight,
    );

    state = state.copyWith(
      fare: AsyncValue.data(fare),
    );
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
