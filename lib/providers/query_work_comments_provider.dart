import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client.dart';
import '../graphql/__generated__/work_comment.data.gql.dart';
import '../graphql/__generated__/work_comment.req.gql.dart';
import '../graphql/__generated__/work_comment.var.gql.dart';

class QueryWorkCommentsProps extends Equatable {
  const QueryWorkCommentsProps({
    required this.workId,
  });

  final String workId;

  @override
  List<Object> get props => [workId];
}

typedef State = OperationResponse<GWorkCommentsData, GWorkCommentsVars>;

final provider = StreamProvider.family<State, QueryWorkCommentsProps>;

final queryWorkCommentsProvider = provider((ref, props) {
  final client = createClient();
  final req = GWorkCommentsReq((builder) {
    return builder..vars.workId = props.workId;
  });
  return client.request(req);
});
