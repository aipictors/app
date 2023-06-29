import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'config.dart';

Client? client;

Client createClient() {
  if (client != null) {
    return client!;
  }

  // final cache = Cache(store: HiveRepository.store!);
  final cache = Cache();

  final link = HttpLink(
    DefaultConfig.graphqlURI,
    defaultHeaders: {
      'secret': DefaultConfig.graphqlSecret,
    },
  );

  client = Client(
    link: link,
    cache: cache,
  );

  return client!;
}
