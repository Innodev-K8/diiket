import 'package:diiket/data/credentials.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

final chatClientProvider = Provider<StreamChatClient>((ref) {
  final String apiKey = Credentials.streamToken;

  final client = StreamChatClient(
    apiKey,
    logLevel: Level.INFO,
  );

  return client;
});
