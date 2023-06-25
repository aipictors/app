import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/works.data.gql.dart';
import '../graphql/__generated__/works.req.gql.dart';
import '../graphql/__generated__/works.var.gql.dart';

part 'query_search_works_provider.g.dart';

class SearchWorksProps extends Equatable {
  const SearchWorksProps({
    required this.search,
  });

  final String search;

  @override
  List<Object> get props => [search];
}

typedef State = Stream<OperationResponse<GWorksData, GWorksVars>>;

@riverpod
State querySearchWorks(QuerySearchWorksRef ref, SearchWorksProps props) {
  final client = createClient();
  final req = GWorksReq((builder) {
    return builder
      ..vars.limit = 40
      ..vars.offset = 0
      ..vars.where.search = props.search;
  });
  return client.request(req);
}
