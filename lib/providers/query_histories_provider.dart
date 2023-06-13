import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client.dart';
import '../graphql/__generated__/histories.data.gql.dart';
import '../graphql/__generated__/histories.req.gql.dart';
import '../graphql/__generated__/histories.var.gql.dart';

class QueryHistoriesProps extends Equatable {
  const QueryHistoriesProps({
    required this.dateTime,
  });

  final String dateTime;

  @override
  List<Object> get props => [dateTime];
}

typedef State = OperationResponse<GHistoriesData, GHistoriesVars>;

final provider = StreamProvider.family<State, QueryHistoriesProps>;

final queryHistoriesProvider = provider((ref, props) {
  final client = createClient();
  final req = GHistoriesReq((builder) {
    return builder
      ..vars.limit = 1024
      ..vars.offset = 0
      ..vars.where.dateText = props.dateTime;
  });
  return client.request(req);
});
