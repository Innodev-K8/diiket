import 'package:diiket/data/models/delivery_detail.dart';
import 'package:diiket/data/network/geocode_service.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deliveryDetailProvider =
    StateNotifierProvider<DeliveryDetailState, DeliveryDetail>((ref) {
  return DeliveryDetailState(ref.read);
});

class DeliveryDetailState extends StateNotifier<DeliveryDetail> {
  Reader _read;

  DeliveryDetailState(this._read) : super(DeliveryDetail());

  Future<void> setDeliveryLocation(LatLng position) async {
    Address? address =
        await _read(geocodeServiceProvider).reverseGeocoding(position);

    state = state.copyWith(
      position: position,
      geocodedPosition: '${address?.streetAddress}, ${address?.city}',
    );
  }

  void setDeliveryAddress([String address = '']) {
    state = state.copyWith(
      address: address,
    );
  }

  void setDeliveryPrice(int deliveryPrice) {
    state = state.copyWith(
      deliveryPrice: deliveryPrice,
    );
  }
}
