import 'package:diiket/data/providers/order/chat/chat_channel_provider.dart';
import 'package:diiket/data/providers/order/chat/chat_client_provider.dart';
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

    return channel == null
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : StreamChannel(
            channel: channel,
            child: ChannelPage(),
          );
  }
}

class ChannelPage extends StatelessWidget {
  ChannelPage({Key? key}) : super(key: key);

  final messageListController = MessageListController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChannelHeader(
        title: Text('Chat Driver'),
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: MessageListView(),
            // child: LazyLoadScrollView(
            //   onEndOfPage: () async {
            //     messageListController.paginateData!();
            //   },
            //   child: MessageListCore(
            //     messageListController: messageListController,
            //     emptyBuilder: (BuildContext context) => const Center(
            //       child: Text('Nothing here yet'),
            //     ),
            //     loadingBuilder: (BuildContext context) => const Center(
            //       child: SizedBox(
            //         height: 100,
            //         width: 100,
            //         child: CircularProgressIndicator(),
            //       ),
            //     ),
            //     messageListBuilder: (
            //       BuildContext context,
            //       List<Message> messages,
            //     ) =>
            //         ListView.builder(
            //       itemCount: messages.length,
            //       reverse: true,
            //       itemBuilder: (BuildContext context, int index) {
            //         final item = messages[index];
            //         final client = StreamChatCore.of(context).client;

            //         if (item.user!.id == client.state.user!.id) {
            //           return Align(
            //             alignment: Alignment.centerRight,
            //             child: MessageText(
            //               message: item,
            //               messageTheme: MessageTheme(),
            //             ),
            //           );
            //         } else {
            //           return Align(
            //             alignment: Alignment.centerLeft,
            //             child: MessageText(
            //               message: item,
            //               messageTheme: MessageTheme(),
            //             ),
            //           );
            //         }
            //       },
            //     ),
            //     errorBuilder: (BuildContext context, error) {
            //       print(error.toString());
            //       return const Center(
            //         child: SizedBox(
            //           height: 100,
            //           width: 100,
            //           child: Text('Oh no, an error occured. Please see logs.'),
            //         ),
            //       );
            //     },
            //   ),
            // ),
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
