import 'package:ferry/ferry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/user_followers.data.gql.dart';
import '../graphql/__generated__/user_followers.req.gql.dart';
import '../graphql/__generated__/user_followers.var.gql.dart';

part 'query_user_followers_provider.freezed.dart';
part 'query_user_followers_provider.g.dart';

@freezed
class QueryUserFollowersProps with _$QueryUserFollowersProps {
  const factory QueryUserFollowersProps({
    required String userId,
    required int page,
  }) = _QueryUserFollowersProps;
}

typedef State = OperationResponse<GUserFollowersData, GUserFollowersVars>;

@riverpod
Stream<State> queryUserFollowers(
  QueryUserFollowersRef ref,
  QueryUserFollowersProps props,
) {
  final client = createClient();
  final req = GUserFollowersReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.user_id = props.userId;
  });
  return client.request(req);
}
