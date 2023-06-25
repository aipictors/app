import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'config.dart';

Client createClient() {
  // final cache = Cache(store: HiveRepository.store!);
  final cache = Cache();

  final link = HttpLink(
    Config.graphqlURI,
    defaultHeaders: {
      'secret': Config.graphqlSecret,
    },
  );

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
