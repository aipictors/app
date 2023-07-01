import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/popular_works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/popular_works.req.gql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_popular_works_provider.g.dart';

@riverpod
Stream<GPopularWorksData?> queryPopularWorks(QueryPopularWorksRef ref) {
  final client = createClient();
  final req = GPopularWorksReq((builder) {
    return builder;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
