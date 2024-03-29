import 'package:diiket/data/network/api_service.dart';
import 'package:diiket/data/network/directions_service.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('it should get correct directions', () async {
    // arrange
    SharedPreferences.setMockInitialValues({});
    
    final dio = ApiService.create();
    final service = DirectionsService(dio);

    // act
    final response = await service.getDirections(
      origin: LatLng(-7.882518830515485, 112.53348198575202),
      destination: LatLng(-7.871126960395285, 112.52672702228088),
    );

    // assert
    expect(response, isNotNull);
    expect(response, isA<Directions>());
  });
}
