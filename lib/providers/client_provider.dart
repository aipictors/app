import 'package:aipictors/client.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'client_provider.g.dart';

@riverpod
Future<Client> client(ClientRef ref) {
  return createClient();
}
