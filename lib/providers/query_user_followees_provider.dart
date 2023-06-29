import 'package:ferry/ferry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/user_followees.data.gql.dart';
import '../graphql/__generated__/user_followees.req.gql.dart';
import '../graphql/__generated__/user_followees.var.gql.dart';

part 'query_user_followees_provider.freezed.dart';
part 'query_user_followees_provider.g.dart';

@freezed
class QueryUserFolloweesProps with _$QueryUserFolloweesProps {
  const factory QueryUserFolloweesProps({
    required String userId,
    required int page,
  }) = _QueryUserFolloweesProps;
}

typedef State = OperationResponse<GUserFolloweesData, GUserFolloweesVars>;

@riverpod
Stream<State> queryUserFollowees(
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
