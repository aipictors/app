import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/best_works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/best_works.req.gql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_best_works_provider.g.dart';

@riverpod
Stream<GBestWorksData?> queryBestWorks(QueryBestWorksRef ref) {
  final client = createClient();
  final req = GBestWorksReq((builder) {
    return builder;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
