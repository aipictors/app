import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/hot_works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/hot_works.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_hot_works_provider.g.dart';

@riverpod
Future<GHotWorksData?> queryHotWorks(QueryHotWorksRef ref) async {
  final client = await createClient();
  final req = GHotWorksReq((builder) {
    return builder;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
