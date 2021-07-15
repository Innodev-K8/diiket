import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:recombee_client/recombee_client.dart';

final recombeeProvider = Provider<RecombeeClient>((ref) {
  return RecombeeClient(
    databaseId: 'diiket-prod',
    publicToken:
        '9OUEC0BhaWxGyc6JqlSSdVOqlm6zqaQ1NMdcZv2fiL5NrskO3G3Oef7MyWimq4sJ',
    useHttps: true,
  );
});
