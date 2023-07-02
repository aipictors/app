import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/user_followers.data.gql.dart';
import 'package:aipictors/graphql/__generated__/user_followers.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_user_followers_provider.freezed.dart';
part 'query_user_followers_provider.g.dart';

@freezed
class QueryUserFollowersProps with _$QueryUserFollowersProps {
  const factory QueryUserFollowersProps({
    required String userId,
    required int page,
  }) = _QueryUserFollowersProps;
}

@riverpod
Future<GUserFollowersData?> queryUserFollowers(
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
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
