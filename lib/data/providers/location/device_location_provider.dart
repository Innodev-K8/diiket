import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trust_location/trust_location.dart';

final isMockLocationProvider = StateProvider<bool>((ref) {
  return false;
});

final deviceLocationProvider =
    StateNotifierProvider<DeviceLocationState, LatLng>((ref) {
  return DeviceLocationState(ref.read);
});

// dont use this state
class DeviceLocationState extends StateNotifier<LatLng> {
  final Reader _read;

  DeviceLocationState(this._read) : super(const LatLng(0, 0)) {
    TrustLocation.start(5);

    TrustLocation.onChange.listen((event) {
      if (event.isMockLocation == true) {
        _read(isMockLocationProvider).state = true;
      } else {
        state = LatLng(
          double.tryParse(event.latitude ?? '0') ?? 0,
          double.tryParse(event.longitude ?? '0') ?? 0,
        );

        _read(isMockLocationProvider).state = false;
      }
    });
  }

  @override
  void dispose() {
    TrustLocation.stop();

    super.dispose();
  }
}
