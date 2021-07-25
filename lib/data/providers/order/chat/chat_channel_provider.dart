import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

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
    required String userId,
  }) async {
    // if the current connected channel is different, disconnect it.
    if (state != null && state?.id != channelId) {
      await disconnect();
    } else if (state?.id == channelId) {
      // if the current connected channel is the same as the new channel, do nothing.
      return;
    }

    final client = _read(chatClientProvider);

    await client.connectUser(
      User(id: userId),
      userToken,
    );

    final channel = client.channel(
      'order-chat',
      id: channelId,
    );

    await channel.watch();

    state = channel;
  }

  Future<void> disconnect() async {
    await state?.client.disconnectUser();
  }
}
