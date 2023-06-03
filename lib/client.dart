import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

import 'global.dart';

Client createClient() {
  final cache = Cache(store: Global.store!);

  final link = HttpLink(
    'https://prompton-ptiui4gkeq-an.a.run.app/api/xt99t8rfh5uhgtna3buj',
  );

  final client = Client(
    link: link,
    cache: cache,
  );

  return client;
}
