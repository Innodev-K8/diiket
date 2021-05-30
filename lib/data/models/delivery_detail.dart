import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'delivery_detail.freezed.dart';

@freezed
class DeliveryDetail with _$DeliveryDetail {
  const DeliveryDetail._();

  factory DeliveryDetail({
    LatLng? position,
    String? geocodedPosition,
    String? address,
    int? deliveryPrice,
  }) = _DeliveryDetail;

  bool fullfiled() {
    if (position == null || deliveryPrice == null) return false;

    return true;
  }
}
