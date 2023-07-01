import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/works.data.gql.dart';
import 'package:aipictors/graphql/__generated__/works.req.gql.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_search_works_provider.freezed.dart';
part 'query_search_works_provider.g.dart';

@freezed
class SearchWorksProps with _$SearchWorksProps {
  const factory SearchWorksProps({
    required String search,
  }) = _SearchWorksProps;
}

@riverpod
Stream<GWorksData?> querySearchWorks(
  QuerySearchWorksRef ref,
  SearchWorksProps props,
) {
  if (props.search.isEmpty) {}
  final client = createClient();
  final req = GWorksReq((builder) {
    return builder
      ..vars.limit = 40
      ..vars.offset = 0
      ..vars.where.search = props.search;
  });
  return client.request(req).map((response) {
    return response.data;
  });
}
