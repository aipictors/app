import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/popular_works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/popular_works.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_popular_works_provider.g.dart';

@riverpod
Future<GPopularWorksData?> queryPopularWorks(QueryPopularWorksRef ref) async {
  ref.keepAlive();
  final client = await createClient();
  final req = GPopularWorksReq((builder) {
    return builder;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
