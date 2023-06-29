import 'package:ferry/ferry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/work_awards.data.gql.dart';
import '../graphql/__generated__/work_awards.req.gql.dart';
import '../graphql/__generated__/work_awards.var.gql.dart';

part 'query_monthly_work_awards_provider.freezed.dart';
part 'query_monthly_work_awards_provider.g.dart';

@freezed
class QueryMonthlyWorkAwardsProps with _$QueryMonthlyWorkAwardsProps {
  const factory QueryMonthlyWorkAwardsProps({
    required int year,
    required int month,
  }) = _QueryMonthlyWorkAwardsProps;
}

typedef State = OperationResponse<GWorkAwardsData, GWorkAwardsVars>;

@riverpod
Stream<State> queryMonthlyWorkAwards(
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
