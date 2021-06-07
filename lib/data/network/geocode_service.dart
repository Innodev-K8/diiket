import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final geocodeServiceProvider = Provider<GeocodeService>((ref) {
  return GeocodeService();
});

class GeocodeService {
  Future<Placemark?> reverseGeocoding(LatLng position) async {
    try {
      Placemark placemark = (await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ))
          .first;

      return placemark;
    } catch (e) {
      return null;
    }
  }
}
