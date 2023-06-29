import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/user_works.data.gql.dart';
import '../graphql/__generated__/user_works.req.gql.dart';
import '../graphql/__generated__/user_works.var.gql.dart';

part 'query_user_works_provider.g.dart';

typedef State = OperationResponse<GUserWorksData, GUserWorksVars>;

@riverpod
Stream<State> queryUserWorks(QueryUserWorksRef ref, String userId) {
  final client = createClient();
  final req = GUserWorksReq((builder) {
    return builder
      ..vars.user_id = userId
      ..vars.limit = 16
      ..vars.offset = 0;
  });
  return client.request(req);
}
