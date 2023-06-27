import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_awards.data.gql.dart';
import '../graphql/__generated__/work_awards.req.gql.dart';
import '../graphql/__generated__/work_awards.var.gql.dart';

part 'query_daily_work_awards_provider.g.dart';

class QueryDailyWorkAwardsProps extends Equatable {
  const QueryDailyWorkAwardsProps({
    required this.year,
    required this.month,
    required this.day,
  });

  final int year;

  final int month;

  final int day;

  @override
  List<Object> get props => [year, month, day];
}

typedef State = Stream<OperationResponse<GWorkAwardsData, GWorkAwardsVars>>;

@riverpod
State queryDailyWorkAwards(
  QueryDailyWorkAwardsRef ref,
  QueryDailyWorkAwardsProps props,
) {
  final client = createClient();
  final req = GWorkAwardsReq((builder) {
    return builder
      ..vars.limit = 128
      ..vars.offset = 0
      ..vars.where.year = props.year
      ..vars.where.month = props.month
      ..vars.where.day = props.day;
  });
  return client.request(req);
}
