import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/best_works.data.gql.dart';
import '../graphql/__generated__/best_works.req.gql.dart';
import '../graphql/__generated__/best_works.var.gql.dart';

part 'query_best_works_provider.g.dart';

typedef State = OperationResponse<GBestWorksData, GBestWorksVars>;

@riverpod
Stream<State> queryBestWorks(QueryBestWorksRef ref) {
  final client = createClient();
  final req = GBestWorksReq((builder) {
    return builder;
  });
  return client.request(req);
}
