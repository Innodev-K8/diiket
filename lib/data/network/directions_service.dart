import 'package:diiket/data/credentials.dart';
import 'package:diiket/data/network/api_service.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final directionsServiceProvider = Provider<DirectionsService>((ref) {
  return DirectionsService(ref.read(apiProvider));
});

class DirectionsService {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsService(this._dio);

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': Credentials.googleMapsApiKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(castOrFallback(response.data, {}));
    }

    return null;
  }
}
