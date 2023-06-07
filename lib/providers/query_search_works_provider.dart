import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client.dart';
import '../graphql/__generated__/works.data.gql.dart';
import '../graphql/__generated__/works.req.gql.dart';
import '../graphql/__generated__/works.var.gql.dart';

class SearchWorksProps extends Equatable {
  const SearchWorksProps({
    required this.search,
  });

  final String search;

  @override
  List<Object> get props => [search];
}

typedef State = OperationResponse<GWorksData, GWorksVars>;

final provider = StreamProvider.family<State, SearchWorksProps>;

final querySearchWorksProvider = provider((ref, props) {
  final client = createClient();
  final req = GWorksReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.where.search = props.search;
  });
  return client.request(req);
});
