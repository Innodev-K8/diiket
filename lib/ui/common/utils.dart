import 'package:diiket/data/providers/auth/auth_provider.dart';
import 'package:diiket/ui/pages/main/home/product/products_by_category_page.dart';
import 'package:diiket/ui/pages/main/home/stall/stall_page.dart';
import 'package:diiket/ui/pages/utils/place_picker.dart';
import 'package:diiket_core/diiket_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: avoid_classes_with_only_static_members
class Utils {
  static final GlobalKey<NavigatorState> appNav = GlobalKey();
  static final GlobalKey<NavigatorState> homeNav = GlobalKey();

  static final GlobalKey<ScaffoldMessengerState> appScaffoldMessager =
      GlobalKey();

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

  static Future<void>? navigateToStall(int stallId, [int? productId]) {
    return homeNav.currentState?.pushNamed(
      StallPage.route,
      arguments: {
        'stall_id': stallId,
        'focused_product_id': productId,
      },
    );
  }

  static Future<void> navigateToProductByCategory(
    ProductFeed? productFeed,
  ) async {
    if (productFeed == null) return;

    await homeNav.currentState?.pushNamed(
      ProductsByCategoryPage.route,
      arguments: {
        'product_feed': productFeed,
      },
    );
  }

  // Old API, for backward compatibility.
  static Future<void> navigateToProductByCategoryOld(
    String? category,
    String? label,
  ) async {
    if (category == null) return;

    await homeNav.currentState?.pushNamed(
      ProductsByCategoryPage.route,
      arguments: {
        'product_feed': ProductFeed(
          title: label ?? category,
          type: ProductSourceType.category,
          query: category,
        ),
      },
    );
  }

  static Future<PlacePickerResult?> pickLocation(
    Market market, {
    LatLng? initialLocation,
  }) async {
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

  static void popPlacePicker(PlacePickerResult? result) {
    appNav.currentState?.pop(result);
  }

  static void alert(String message) {
    late SnackBarBehavior behavior;
    final String behaviorConfig = RemoteConfig.instance.getString(
      'alert_snackbar_behavior',
    );

    switch (behaviorConfig) {
      case 'floating':
        behavior = SnackBarBehavior.floating;
        break;
      case 'fixed':
      default:
        behavior = SnackBarBehavior.fixed;
        break;
    }

    appScaffoldMessager.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: behavior,
      ),
    );
  }

  static Future<void> signOutPrompt(BuildContext context) async {
    // set up the buttons
    final Widget cancelButton = TextButton(
      onPressed: () {
        appNav.currentState?.pop();
      },
      child: const Text("Tidak"),
    );
    final Widget continueButton = TextButton(
      onPressed: () {
        appNav.currentState?.pop();
        context.read(authProvider.notifier).signOut();
      },
      child: const Text(
        "Ya",
        style: TextStyle(
          color: ColorPallete.primaryColor,
        ),
      ),
    );

    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      title: const Text("Perhatian"),
      content: const Text("Anda yakin ingin keluar dari akun ini?"),
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
