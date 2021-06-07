import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:trust_location/trust_location.dart';

class LocationService {
  static final _instance = Location();

  static bool? _serviceEnabled;
  static PermissionStatus? _permissionGranted;

  static Future<LatLng?> getUserPosition() async {
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

      if (TrustLocation.isMockLocation == true) return null;

      LocationData location = await _instance.getLocation();

      // final List<String?> latLong = await TrustLocation.getLatLong;

      // final double? lat = double.tryParse(latLong[0]!);
      // final double? lng = double.tryParse(latLong[1]!);

      if (location.latitude != null && location.longitude != null) {
        return LatLng(location.latitude!, location.longitude!);
      }

      return null;
    } on Exception catch (_) {
      return null;
    }
  }
}