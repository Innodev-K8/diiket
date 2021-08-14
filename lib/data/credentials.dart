import 'package:flutter/foundation.dart';

// hold api tokens
// ignore: avoid_classes_with_only_static_members
class Credentials {
  // force use production token
  static const bool _forceProd = true;

  static String apiEndpoint = set(
    prod: 'https://diiket.rejoin.id/api/v1',
    dev: 'https://82144c857d4f.ngrok.io/api/v1',
  );

  static String googleMapsApiKey = set(
    prod: 'AIzaSyAtRv3aJE1s6JWKPNxEY5Xsc8I1M1Baayw',
  );

  static String pusherToken = set(
    prod: '4144774926a400dddc07',
    dev: 'd244fbd9f96cbf4f69ba',
  );

  static String streamToken = set(
    prod: 'vs32uae8f493',
  );

  static String recombeeToken = set(
    prod: '9OUEC0BhaWxGyc6JqlSSdVOqlm6zqaQ1NMdcZv2fiL5NrskO3G3Oef7MyWimq4sJ',
  );
  static String recombeeDbId = set(
    prod: 'diiket-prod',
  );

  static String set({required String prod, String? dev}) {
    return _forceProd ? prod : (kReleaseMode ? prod : dev ?? prod);
  }
}
