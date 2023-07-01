import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/user_works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/user_works.req.gql.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_user_works_provider.g.dart';

@riverpod
Stream<GUserWorksData?> queryUserWorks(QueryUserWorksRef ref, String userId) {
  final client = createClient();
  final req = GUserWorksReq((builder) {
    return builder
      ..vars.user_id = userId
      ..vars.limit = 16
      ..vars.offset = 0;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
