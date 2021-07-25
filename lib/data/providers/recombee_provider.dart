import 'package:diiket/data/credentials.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recombee_client/recombee_client.dart';

final recombeeProvider = Provider<RecombeeClient>((ref) {
  return RecombeeClient(
    databaseId: Credentials.recombeeDbId,
    publicToken: Credentials.recombeeToken,
    useHttps: true,
  );
});
