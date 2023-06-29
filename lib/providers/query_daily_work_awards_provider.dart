import 'package:ferry/ferry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_awards.data.gql.dart';
import '../graphql/__generated__/work_awards.req.gql.dart';
import '../graphql/__generated__/work_awards.var.gql.dart';

part 'query_daily_work_awards_provider.freezed.dart';
part 'query_daily_work_awards_provider.g.dart';

@freezed
class QueryDailyWorkAwardsProps with _$QueryDailyWorkAwardsProps {
  const factory QueryDailyWorkAwardsProps({
    required int year,
    required int month,
    required int day,
  }) = _QueryDailyWorkAwardsProps;
}

typedef State = OperationResponse<GWorkAwardsData, GWorkAwardsVars>;

@riverpod
Stream<State> queryDailyWorkAwards(
  QueryDailyWorkAwardsRef ref,
  QueryDailyWorkAwardsProps props,
) {
  ref.keepAlive();
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
