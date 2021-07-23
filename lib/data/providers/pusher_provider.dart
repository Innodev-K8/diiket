import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pusher_client/pusher_client.dart';

final pusherProvider = Provider<PusherClient>((ref) {
  // final String key =
  //     kReleaseMode ? '4144774926a400dddc07' : 'd244fbd9f96cbf4f69ba';

  const String key = '4144774926a400dddc07';

  final PusherOptions options = PusherOptions(cluster: 'ap1');

  return PusherClient(key, options, autoConnect: false);
});
