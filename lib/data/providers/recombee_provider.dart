import 'package:diiket/data/credentials.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recombee_client/recombee_client.dart';

final recombeeProvider = Provider<RecombeeClient>((ref) {
  final credentials = ref.watch(credentialsProvider);

  return RecombeeClient(
    databaseId: credentials.recombeeDbId,
    publicToken: credentials.recombeeToken,
    useHttps: true,
  );
});
