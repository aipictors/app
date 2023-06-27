import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/hot_works.data.gql.dart';
import '../graphql/__generated__/hot_works.req.gql.dart';
import '../graphql/__generated__/hot_works.var.gql.dart';

part 'query_hot_works_provider.g.dart';

typedef State = Stream<OperationResponse<GHotWorksData, GHotWorksVars>>;

@riverpod
State queryHotWorks(
  QueryHotWorksRef ref,
) {
  final client = createClient();
  final req = GHotWorksReq((builder) {
    return builder;
  });
  return client.request(req);
}
