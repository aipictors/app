import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/user_followees.data.gql.dart';
import 'package:aipictors/graphql/__generated__/user_followees.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_user_followees_provider.freezed.dart';
part 'query_user_followees_provider.g.dart';

@freezed
class QueryUserFolloweesProps with _$QueryUserFolloweesProps {
  const factory QueryUserFolloweesProps({
    required String userId,
    required int page,
  }) = _QueryUserFolloweesProps;
}

@riverpod
Future<GUserFolloweesData?> queryUserFollowees(
  QueryUserFolloweesRef ref,
  QueryUserFolloweesProps props,
) async {
  final client = await createClient();
  final req = GUserFolloweesReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.user_id = props.userId;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
