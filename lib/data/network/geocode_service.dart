import 'package:diiket/data/models/directions.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final geocodeServiceProvider = Provider<GeocodeService>((ref) {
  return GeocodeService();
});

class GeocodeService {
  GeoCode _geoCode = GeoCode(apiKey: 'AIzaSyAtRv3aJE1s6JWKPNxEY5Xsc8I1M1Baayw');

  Future<Address?> reverseGeocoding(LatLng position) async {
    try {
      Address address = await _geoCode.reverseGeocoding(
          latitude: position.latitude, longitude: position.longitude);

      return address;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
