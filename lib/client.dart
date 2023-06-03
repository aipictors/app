import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'config.dart';
import 'global.dart';

Client createClient() {
  final cache = Cache(store: Global.store!);

  final link = HttpLink(Config.graphqlURI);

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
