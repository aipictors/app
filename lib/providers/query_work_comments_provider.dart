import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/work_comments.data.gql.dart';
import 'package:aipictors/graphql/__generated__/work_comments.req.gql.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
