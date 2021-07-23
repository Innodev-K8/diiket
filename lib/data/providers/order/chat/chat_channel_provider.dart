import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:diiket/data/models/user.dart' as models;

import 'chat_client_provider.dart';

final orderChatChannelProvider =
    StateNotifierProvider<OrderChatChannel, Channel?>((ref) {
  return OrderChatChannel(ref.read);
});

class OrderChatChannel extends StateNotifier<Channel?> {
  final Reader _read;

  OrderChatChannel(this._read) : super(null);

  Future<void> connect({
    required String channelId,
    required String userToken,
    required models.User user,
  }) async {
    // if the current connected channel is different, disconnect it.
    if (state != null && state?.id != channelId) {
      await disconnect();
    } else if (state?.id == channelId) {
      print('already connected to channel');
      // if the current connected channel is the same as the new channel, do nothing.
      return;
    }

    final client = _read(chatClientProvider);

    await client.connectUser(
      User(
        id: '${user.id}',
        extraData: {
          // image for user
          'image': user.profile_picture_url,
        },
      ),
      userToken,
    );

    final channel = client.channel(
      'order-chat',
      id: channelId,
      extraData: {
        // image for channel
        // 'image': 'https://diiket.netlify.app/favicon.ico',
        'image': user.profile_picture_url,
      },
    );

    await channel.watch();

    await channel.addMembers(['7']);

    state = channel;
  }

  Future<void> disconnect() async {
    await state?.stopWatching();
    await state?.client.disconnectUser();
  }
}
