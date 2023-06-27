import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/user_followees.data.gql.dart';
import '../graphql/__generated__/user_followees.req.gql.dart';
import '../graphql/__generated__/user_followees.var.gql.dart';

part 'query_user_followees_provider.g.dart';

class QueryUserFolloweesProps extends Equatable {
  const QueryUserFolloweesProps({
    required this.userId,
    required this.page,
  });

  final String userId;

  final int page;

  @override
  List<Object> get props => [userId, page];
}

typedef State
    = Stream<OperationResponse<GUserFolloweesData, GUserFolloweesVars>>;

@riverpod
State queryUserFollowees(
  QueryUserFolloweesRef ref,
  QueryUserFolloweesProps props,
) {
  final client = createClient();
  final req = GUserFolloweesReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.user_id = props.userId;
  });
  return client.request(req);
}
