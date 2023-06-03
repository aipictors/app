import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client.dart';
import '../graphql/__generated__/works.req.gql.dart';

final queryWorksProvider = StreamProvider((ref) {
  final client = createClient();
  final req = GWorksReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.where.search = "";
  });
  return client.request(req);
});
