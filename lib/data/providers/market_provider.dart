import 'package:diiket/data/network/market_service.dart';
import 'package:diiket/data/services/location_service.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentMarketProvider = StateProvider<Market?>((ref) {
  return null;
});

final nearbyMarketsProvider = FutureProvider<List<Market>>((ref) async {
  final LatLng? userPosition = await LocationService.getUserPosition(
    allowMockLocation: true,
  );

  return ref.read(marketServiceProvider).getNearbyMarket(
        latitude: userPosition?.latitude,
        longitude: userPosition?.longitude,
      );
});
