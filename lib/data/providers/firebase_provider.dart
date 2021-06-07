import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final remoteConfigProvider = Provider<RemoteConfig>((ref) {
  final instance = RemoteConfig.instance;

  instance.setDefaults(<String, dynamic>{
    'product_feeds':
        '[{"label":"Produk","query":"all"},{"label":"Terlaris","query":"popular"}]',
  });

  return instance;
});
