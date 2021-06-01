import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

part 'directions.freezed.dart';

@freezed
class Directions with _$Directions {
  const Directions._();

  factory Directions({
    final LatLngBounds? bounds,
    final List<PointLatLng>? polylinePoints,
    final int? totalDistance,
    final int? totalDuration,
    final Placemark? placemark,
  }) = _Directions;

  factory Directions.fromMap(Map<String, dynamic> map) {
    // Check if route is not available
    if ((map['routes'] as List).isEmpty) return Directions();

    // Get route information
    final data = Map<String, dynamic>.from(map['routes'][0]);

    // Bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    // Distance & Duration
    int distance = 0;
    int duration = 0;
    if ((data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['value'];
      duration = leg['duration']['value'];
    }

    return Directions(
      bounds: bounds,
      polylinePoints:
          PolylinePoints().decodePolyline(data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}

// abstract class Directions with{
//   final LatLngBounds? bounds;
//   final List<PointLatLng>? polylinePoints;
//   final int? totalDistance;
//   final int? totalDuration;
//   final String? geocodedPosition;

//   Directions({
//     this.bounds,
//     this.polylinePoints,
//     this.totalDistance,
//     this.totalDuration,
//     this.geocodedPosition,
//   });

//   factory Directions.fromMap(Map<String, dynamic> map) {
//     // Check if route is not available
//     if ((map['routes'] as List).isEmpty) return Directions();

//     // Get route information
//     final data = Map<String, dynamic>.from(map['routes'][0]);

//     // Bounds
//     final northeast = data['bounds']['northeast'];
//     final southwest = data['bounds']['southwest'];
//     final bounds = LatLngBounds(
//       northeast: LatLng(northeast['lat'], northeast['lng']),
//       southwest: LatLng(southwest['lat'], southwest['lng']),
//     );

//     // Distance & Duration
//     int distance = 0;
//     int duration = 0;
//     if ((data['legs'] as List).isNotEmpty) {
//       final leg = data['legs'][0];
//       distance = leg['distance']['value'];
//       duration = leg['duration']['value'];
//     }

//     return Directions(
//       bounds: bounds,
//       polylinePoints:
//           PolylinePoints().decodePolyline(data['overview_polyline']['points']),
//       totalDistance: distance,
//       totalDuration: duration,
//     );
//   }
// }
