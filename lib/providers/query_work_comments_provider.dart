import 'package:ferry/ferry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_comments.data.gql.dart';
import '../graphql/__generated__/work_comments.req.gql.dart';
import '../graphql/__generated__/work_comments.var.gql.dart';

part 'query_work_comments_provider.freezed.dart';
part 'query_work_comments_provider.g.dart';

@freezed
class QueryWorkCommentsProps with _$QueryWorkCommentsProps {
  const factory QueryWorkCommentsProps({
    required String workId,
  }) = _QueryWorkCommentsProps;
}

typedef State = OperationResponse<GWorkCommentsData, GWorkCommentsVars>;

@riverpod
Stream<State> queryWorkComments(
  QueryWorkCommentsRef ref,
  QueryWorkCommentsProps props,
) {
  final client = createClient();
  final req = GWorkCommentsReq((builder) {
    return builder..vars.workId = props.workId;
  });
  return client.request(req);
}
