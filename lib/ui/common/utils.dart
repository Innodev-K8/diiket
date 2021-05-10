import 'package:flutter/cupertino.dart';

class Utils {
  static final GlobalKey<NavigatorState> appNav = GlobalKey();
  static final GlobalKey<NavigatorState> homeNav = GlobalKey();

  static void resetHomeNavigation() {
    homeNav.currentState?.popUntil(
      (route) => route.isFirst,
    );
  }
}
