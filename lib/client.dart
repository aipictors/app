import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'config.dart';

Client createClient() {
  // final cache = Cache(store: Global.store!);
  final cache = Cache();

  final link = HttpLink(
    Config.graphqlURI,
    defaultHeaders: {
      'token': Config.graphqlToken,
    },
  );

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
