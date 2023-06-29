import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/best_works.data.gql.dart';
import '../graphql/__generated__/best_works.req.gql.dart';

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
