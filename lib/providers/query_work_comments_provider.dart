import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_comments.data.gql.dart';
import '../graphql/__generated__/work_comments.req.gql.dart';
import '../graphql/__generated__/work_comments.var.gql.dart';

part 'query_work_comments_provider.g.dart';

class QueryWorkCommentsProps extends Equatable {
  const QueryWorkCommentsProps({
    required this.workId,
  });

  final String workId;

  @override
  List<Object> get props => [workId];
}

typedef State = Stream<OperationResponse<GWorkCommentsData, GWorkCommentsVars>>;

@riverpod
State queryWorkComments(
  QueryWorkCommentsRef ref,
  QueryWorkCommentsProps props,
) {
  final client = createClient();
  final req = GWorkCommentsReq((builder) {
    return builder..vars.workId = props.workId;
  });
  return client.request(req);
}
