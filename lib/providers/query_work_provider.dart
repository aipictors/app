import 'package:ferry/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client.dart';
import '../graphql/__generated__/work.data.gql.dart';
import '../graphql/__generated__/work.req.gql.dart';
import '../graphql/__generated__/work.var.gql.dart';

final queryWorkProvider = StreamProvider.autoDispose
    .family<OperationResponse<GWorkData, GWorkVars>, String>((ref, id) {
  final client = createClient();
  final req = GWorkReq((builder) {
    return builder..vars.id = id;
  });
  return client.request(req);
});
