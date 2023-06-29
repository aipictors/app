import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/popular_works.data.gql.dart';
import '../graphql/__generated__/popular_works.req.gql.dart';
import '../graphql/__generated__/popular_works.var.gql.dart';

part 'query_popular_works_provider.g.dart';

typedef State = OperationResponse<GPopularWorksData, GPopularWorksVars>;

@riverpod
Stream<State> queryPopularWorks(QueryPopularWorksRef ref) {
  final client = createClient();
  final req = GPopularWorksReq((builder) {
    return builder;
  });
  return client.request(req);
}
