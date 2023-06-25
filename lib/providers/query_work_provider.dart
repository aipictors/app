import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work.data.gql.dart';
import '../graphql/__generated__/work.req.gql.dart';
import '../graphql/__generated__/work.var.gql.dart';

part 'query_work_provider.g.dart';

typedef State = Stream<OperationResponse<GWorkData, GWorkVars>>;

@riverpod
State queryWork(QueryWorkRef ref, String id) {
  final client = createClient();
  final req = GWorkReq((builder) {
    return builder..vars.id = id;
  });
  return client.request(req);
}
