import 'package:diiket/data/models/directions.dart';
import 'package:diiket/data/models/fare.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'delivery_detail.freezed.dart';

@freezed
class DeliveryDetail with _$DeliveryDetail {
  const DeliveryDetail._();

  factory DeliveryDetail({
    LatLng? position,
    String? geocodedPosition,
    String? address,
    Directions? directions,
    AsyncValue<Fare>? fare,
  }) = _DeliveryDetail;

  bool fullfiled() {
    if (position == null || fare?.data?.value.total_fee == null) return false;

    return true;
  }
}
