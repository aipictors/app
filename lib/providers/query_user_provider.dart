import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/user.data.gql.dart';
import '../graphql/__generated__/user.req.gql.dart';

part 'query_user_provider.g.dart';

@riverpod
Stream<GUserData?> queryUser(QueryUserRef ref, String id) {
  final client = createClient();
  final req = GUserReq((builder) {
    return builder..vars.userId = id;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
