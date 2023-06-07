import 'package:ferry/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client.dart';
import '../graphql/__generated__/work.data.gql.dart';
import '../graphql/__generated__/work.req.gql.dart';
import '../graphql/__generated__/work.var.gql.dart';

typedef State = OperationResponse<GWorkData, GWorkVars>;

final provider = StreamProvider.autoDispose.family<State, String>;

final queryWorkProvider = provider((ref, id) {
  final client = createClient();
  final req = GWorkReq((builder) {
    return builder..vars.id = id;
  });
  return client.request(req);
});
