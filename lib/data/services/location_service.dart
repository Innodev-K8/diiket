import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trust_location/trust_location.dart';

class LocationService {
  static final LocationService _singleton = LocationService._();

  factory LocationService() {
    return _singleton;
  }

  LocationService._();

  static final _instance = Location();

  static late bool? _serviceEnabled;
  static PermissionStatus? _permissionGranted;

  static Future<LatLng?> getUserPosition(
      {bool allowMockLocation = false}) async {
    try {
      _serviceEnabled = await _instance.serviceEnabled();

      if (!_serviceEnabled!) {
        _serviceEnabled = await _instance.requestService();

        if (!_serviceEnabled!) {
          return null;
        }
      }

      _permissionGranted = await _instance.hasPermission();

      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await _instance.requestPermission();

        if (_permissionGranted != PermissionStatus.granted) {
          return null;
        }
      }

      final bool isMockLocation = await TrustLocation.isMockLocation;

      if (!allowMockLocation && isMockLocation == true && kReleaseMode) {
        return null;
      }

      final LocationData location = await _instance.getLocation();

      if (location.latitude != null && location.longitude != null) {
        return LatLng(location.latitude!, location.longitude!);
      }

      return null;
    } on Exception catch (_) {
      return null;
    }
  }
}
