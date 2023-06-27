import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/user_followers.data.gql.dart';
import '../graphql/__generated__/user_followers.req.gql.dart';
import '../graphql/__generated__/user_followers.var.gql.dart';

part 'query_user_followers_provider.g.dart';

class QueryUserFollowersProps extends Equatable {
  const QueryUserFollowersProps({
    required this.userId,
    required this.page,
  });

  final String userId;

  final int page;

  @override
  List<Object> get props => [userId, page];
}

typedef State
    = Stream<OperationResponse<GUserFollowersData, GUserFollowersVars>>;

@riverpod
State queryUserFollowers(
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
