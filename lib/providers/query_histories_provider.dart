import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/histories.data.gql.dart';
import '../graphql/__generated__/histories.req.gql.dart';
import '../graphql/__generated__/histories.var.gql.dart';

part 'query_histories_provider.g.dart';

class QueryHistoriesProps extends Equatable {
  const QueryHistoriesProps({
    required this.dateTime,
  });

  final String dateTime;

  @override
  List<Object> get props => [dateTime];
}

typedef State = Stream<OperationResponse<GHistoriesData, GHistoriesVars>>;

@riverpod
State queryHistories(QueryHistoriesRef ref, QueryHistoriesProps props) {
  final client = createClient();
  final req = GHistoriesReq((builder) {
    return builder
      ..vars.limit = 1024
      ..vars.offset = 0
      ..vars.where.dateText = props.dateTime;
  });
  return client.request(req);
}
