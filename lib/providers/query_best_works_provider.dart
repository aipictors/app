import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/best_works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/best_works.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_best_works_provider.g.dart';

@riverpod
Future<GBestWorksData?> queryBestWorks(QueryBestWorksRef ref) async {
  final client = await createClient();
  final req = GBestWorksReq((builder) {
    return builder;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
