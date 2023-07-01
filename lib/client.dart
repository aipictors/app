import 'package:aipictors/config.dart';
import 'package:aipictors/repositories/hive_repository.dart';
import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

Client? client;

Client createClient() {
  if (client != null) {
    return client!;
  }

  final store = HiveRepository.getStore();

  final cache = DefaultConfig.isProduction ? Cache(store: store) : null;

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
