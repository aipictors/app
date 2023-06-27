import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_awards.data.gql.dart';
import '../graphql/__generated__/work_awards.req.gql.dart';
import '../graphql/__generated__/work_awards.var.gql.dart';

part 'query_monthly_work_awards_provider.g.dart';

class QueryMonthlyWorkAwardsProps extends Equatable {
  const QueryMonthlyWorkAwardsProps({
    required this.year,
    required this.month,
  });

  final int year;

  final int month;

  @override
  List<Object> get props => [year, month];
}

typedef State = Stream<OperationResponse<GWorkAwardsData, GWorkAwardsVars>>;

@riverpod
State queryMonthlyWorkAwards(
  QueryMonthlyWorkAwardsRef ref,
  QueryMonthlyWorkAwardsProps props,
) {
  final client = createClient();
  final req = GWorkAwardsReq((builder) {
    return builder
      ..vars.limit = 128
      ..vars.offset = 0
      ..vars.where.year = props.year
      ..vars.where.month = props.month;
  });
  return client.request(req);
}
