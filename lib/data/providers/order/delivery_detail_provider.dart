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
  Reader _read;

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
      fare: AsyncValue.loading(),
    );

    Fare fare = await _read(fareServiceProvider).calculate(
      state.directions?.totalDistance ?? 0,
      _read(activeOrderProvider.notifier).totalProductWeight,
    );

    state = state.copyWith(
      fare: AsyncValue.data(fare),
    );
  }

  void setDeliveryDirections(LatLng? position, Directions? directions) {
    final placeMark = directions?.placemark;

    String? subLocality = placeMark?.subLocality;
    String? locality = placeMark?.locality;
    String? administrativeArea = placeMark?.administrativeArea;
    String? postalCode = placeMark?.postalCode;

    String address =
        "${subLocality ?? '-'}, ${locality ?? '-'}, ${administrativeArea ?? '-'} ${postalCode ?? '-'}";

    state = state.copyWith(
      position: position,
      directions: directions,
      geocodedPosition: address,
    );
  }
}
