import 'package:aipictors/config.dart';
import 'package:aipictors/repositories/hive_repository.dart';
import 'package:ferry/ferry.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gql_http_link/gql_http_link.dart';

Future<Client> createClient() async {
  final store = HiveRepository.getStore();

  final cache = DefaultConfig.isProduction ? Cache(store: store) : null;

  final token = await FirebaseAuth.instance.currentUser?.getIdToken(false);

  final httpLink = HttpLink(
    DefaultConfig.graphqlURI,
    defaultHeaders: {
      'secret': DefaultConfig.graphqlSecret,
      if (token != null) 'authorization': 'Bearer $token',
    },
  );

  return Client(
    link: httpLink,
    cache: cache,
  );
}
