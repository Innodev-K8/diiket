import 'package:diiket/data/models/market.dart';
import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:diiket/ui/pages/utils/place_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Utils {
  static final GlobalKey<NavigatorState> appNav = GlobalKey();
  static final GlobalKey<NavigatorState> homeNav = GlobalKey();

  static void resetAppNavigation() {
    appNav.currentState?.popUntil(
      (route) => route.isFirst,
    );
  }

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

  static alert(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static Future<void> signOutPrompt(BuildContext context) async {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Tidak"),
      onPressed: () {
        appNav.currentState?.pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(
        "Ya",
        style: TextStyle(
          color: ColorPallete.primaryColor,
        ),
      ),
      onPressed: () {
        appNav.currentState?.pop();
        context.read(authProvider.notifier).signOut();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Perhatian"),
      content: Text("Anda yakin ingin keluar dari akun ini?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
