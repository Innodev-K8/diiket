import 'package:diiket/data/models/market.dart';
import 'package:diiket/ui/pages/utils/place_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';

class Utils {
  static final GlobalKey<NavigatorState> appNav = GlobalKey();
  static final GlobalKey<NavigatorState> homeNav = GlobalKey();

  static void resetHomeNavigation() {
    homeNav.currentState?.popUntil(
      (route) => route.isFirst,
    );
  }

  static Future<PlacePickerResult?> pickLocation(Market market,
      {LatLng? initialLocation}) async {
    return await appNav.currentState?.push(
      PageTransition(
        child: PlacePicker(
          market: market,
          initialPosition: initialLocation,
        ),
        type: PageTransitionType.fade,
      ),
    );
  }

  static popPlacePicker(PlacePickerResult? result) async {
    appNav.currentState?.pop(result);
  }
}
