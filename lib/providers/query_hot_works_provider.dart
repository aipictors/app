import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/hot_works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/hot_works.req.gql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_hot_works_provider.g.dart';

@riverpod
Stream<GHotWorksData?> queryHotWorks(
  QueryHotWorksRef ref,
) {
  final client = createClient();
  final req = GHotWorksReq((builder) {
    return builder;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
