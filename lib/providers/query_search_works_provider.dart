import 'package:ferry/ferry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/works.data.gql.dart';
import '../graphql/__generated__/works.req.gql.dart';
import '../graphql/__generated__/works.var.gql.dart';

part 'query_search_works_provider.freezed.dart';
part 'query_search_works_provider.g.dart';

@freezed
class SearchWorksProps with _$SearchWorksProps {
  const factory SearchWorksProps({
    required String search,
  }) = _SearchWorksProps;
}

typedef State = OperationResponse<GWorksData, GWorksVars>;

@riverpod
Stream<State> querySearchWorks(
  QuerySearchWorksRef ref,
  SearchWorksProps props,
) {
  final client = createClient();
  final req = GWorksReq((builder) {
    return builder
      ..vars.limit = 40
      ..vars.offset = 0
      ..vars.where.search = props.search;
  });
  return client.request(req);
}
