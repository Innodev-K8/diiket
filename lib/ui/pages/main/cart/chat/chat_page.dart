import 'package:diiket/data/providers/order/active_order_provider.dart';
import 'package:diiket/data/providers/order/chat/chat_channel_provider.dart';
import 'package:diiket/ui/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatPage extends HookWidget {
  static String route = '/chat';

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final channel = useProvider(orderChatChannelProvider);

    return ProviderListener(
      provider: activeOrderProvider,
      onChange: (context, order) {
        if (order == null) {
          Navigator.of(context).pop();
        }
      },
      child: channel == null
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : StreamChannel(
              channel: channel,
              child: ChannelPage(),
            ),
    );
  }
}

class ChannelPage extends StatelessWidget {
  ChannelPage({Key? key}) : super(key: key);

  final messageListController = MessageListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChannelHeader(),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: MessageListView(),
          ),
          MessageInput(
            activeSendButton: Padding(
              padding: EdgeInsets.all(8.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.send_rounded,
                  color: ColorPallete.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
