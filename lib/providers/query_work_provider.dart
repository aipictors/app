import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/work.data.gql.dart';
import 'package:aipictors/graphql/__generated__/work.req.gql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_work_provider.g.dart';

@riverpod
Stream<GWorkData?> queryWork(QueryWorkRef ref, String id) {
  final client = createClient();
  final req = GWorkReq((builder) {
    return builder..vars.id = id;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
