import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/works.data.gql.dart';
import '../graphql/__generated__/works.req.gql.dart';
import '../graphql/__generated__/works.var.gql.dart';

part 'query_works_provider.g.dart';

typedef State = OperationResponse<GWorksData, GWorksVars>;

@riverpod
Stream<State> queryWorks(QueryWorksRef ref) {
  final client = createClient();
  final req = GWorksReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.where.search = "";
  });
  return client.request(req);
}
