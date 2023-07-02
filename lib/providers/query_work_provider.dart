import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/work.data.gql.dart';
import 'package:aipictors/graphql/__generated__/work.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_work_provider.g.dart';

@riverpod
Future<GWorkData?> queryWork(QueryWorkRef ref, String id) async {
  final client = await createClient();
  final req = GWorkReq((builder) {
    return builder..vars.id = id;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
