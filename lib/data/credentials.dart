import 'package:diiket/data/providers/firebase_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Credentials {
  late String apiEndpoint;
  late String googleMapsApiKey;
  late String pusherToken;
  late String streamToken;
  late String recombeeToken;
  late String recombeeDbId;

  bool forceProd;

  Credentials({
    required String prodApiEndpoint,
    String? devApiEndpoint,
    required String prodGoogleMapsApiKey,
    String? devGoogleMapsApiKey,
    required String prodPusherToken,
    String? devPusherToken,
    required String prodStreamToken,
    String? devStreamToken,
    required String prodRecombeeToken,
    String? devRecombeeToken,
    required String prodRecombeeDbId,
    String? devRecombeeDbId,
    this.forceProd = false,
  }) {
    apiEndpoint = set(
      prod: prodApiEndpoint,
      dev: devApiEndpoint,
    );
    googleMapsApiKey = set(
      prod: prodGoogleMapsApiKey,
      dev: devGoogleMapsApiKey,
    );
    pusherToken = set(
      prod: prodPusherToken,
      dev: devPusherToken,
    );
    streamToken = set(
      prod: prodStreamToken,
      dev: devStreamToken,
    );
    recombeeToken = set(
      prod: prodRecombeeToken,
      dev: devRecombeeToken,
    );
    recombeeDbId = set(
      prod: prodRecombeeDbId,
      dev: devRecombeeDbId,
    );

    final bool isProd = forceProd || kReleaseMode;

    debugPrint("[CONFIG] apiEndpoint: $apiEndpoint");
    debugPrint("[CONFIG] forceProd: $forceProd");
    debugPrint("[CONFIG] isProd: $isProd");
  }

  T set<T>({required T prod, T? dev}) {
    if (dev is String && dev.isEmpty) {
      dev = null;
    }

    final bool isProd = forceProd || kReleaseMode;

    return isProd ? prod : (dev ?? prod);
  }
}

final credentialsProvider = Provider<Credentials>((ref) {
  final remoteConfig = ref.watch(remoteConfigProvider);

  return Credentials(
    prodApiEndpoint: remoteConfig.getString('prod_api_endpoint'),
    devApiEndpoint: remoteConfig.getString('dev_api_endpoint'),
    prodGoogleMapsApiKey: remoteConfig.getString('prod_google_maps_api_key'),
    devGoogleMapsApiKey: remoteConfig.getString('dev_google_maps_api_key'),
    prodPusherToken: remoteConfig.getString('prod_pusher_token'),
    devPusherToken: remoteConfig.getString('dev_pusher_token'),
    prodStreamToken: remoteConfig.getString('prod_stream_token'),
    devStreamToken: remoteConfig.getString('dev_stream_token'),
    prodRecombeeToken: remoteConfig.getString('prod_recombee_token'),
    devRecombeeToken: remoteConfig.getString('dev_recombee_token'),
    prodRecombeeDbId: remoteConfig.getString('prod_recombee_db_id'),
    devRecombeeDbId: remoteConfig.getString('dev_recombee_db_id'),
    forceProd: remoteConfig.getBool('force_prod'),
  );
});
