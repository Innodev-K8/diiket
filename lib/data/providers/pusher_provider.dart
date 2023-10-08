import 'package:diiket/data/credentials.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusher_client/pusher_client.dart';

final pusherProvider = Provider<PusherClient>((ref) {
  final credentials = ref.watch(credentialsProvider);

  final String key = credentials.pusherToken;

  final PusherOptions options = PusherOptions(cluster: 'ap1');

  return PusherClient(key, options, autoConnect: false);
});
