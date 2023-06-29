import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_comments.data.gql.dart';
import '../graphql/__generated__/work_comments.req.gql.dart';

part 'query_work_comments_provider.freezed.dart';
part 'query_work_comments_provider.g.dart';

@freezed
class QueryWorkCommentsProps with _$QueryWorkCommentsProps {
  const factory QueryWorkCommentsProps({
    required String workId,
  }) = _QueryWorkCommentsProps;
}

@riverpod
Stream<GWorkCommentsData?> queryWorkComments(
  QueryWorkCommentsRef ref,
  QueryWorkCommentsProps props,
) {
  final client = createClient();
  final req = GWorkCommentsReq((builder) {
    return builder..vars.workId = props.workId;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
