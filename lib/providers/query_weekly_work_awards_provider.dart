import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_awards.data.gql.dart';
import '../graphql/__generated__/work_awards.req.gql.dart';
import '../graphql/__generated__/work_awards.var.gql.dart';

part 'query_weekly_work_awards_provider.g.dart';

class QueryWeeklyWorkAwardsProps extends Equatable {
  const QueryWeeklyWorkAwardsProps({
    required this.year,
    required this.month,
    required this.weekIndex,
  });

  final int year;

  final int month;

  final int weekIndex;

  @override
  List<Object> get props => [year, month, weekIndex];
}

typedef State = Stream<OperationResponse<GWorkAwardsData, GWorkAwardsVars>>;

@riverpod
State queryWeeklyWorkAwards(
  QueryWeeklyWorkAwardsRef ref,
  QueryWeeklyWorkAwardsProps props,
) {
  final client = createClient();
  final req = GWorkAwardsReq((builder) {
    return builder
      ..vars.limit = 128
      ..vars.offset = 0
      ..vars.where.year = props.year
      ..vars.where.month = props.month
      ..vars.where.weekIndex = props.weekIndex;
  });
  return client.request(req);
}
