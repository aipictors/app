import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/work_awards.data.gql.dart';
import 'package:aipictors/graphql/__generated__/work_awards.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_weekly_work_awards_provider.freezed.dart';
part 'query_weekly_work_awards_provider.g.dart';

@freezed
class QueryWeeklyWorkAwardsProps with _$QueryWeeklyWorkAwardsProps {
  const factory QueryWeeklyWorkAwardsProps({
    required int year,
    required int month,
    required int weekIndex,
  }) = _QueryWeeklyWorkAwardsProps;
}

@riverpod
Future<GWorkAwardsData?> queryWeeklyWorkAwards(
  QueryWeeklyWorkAwardsRef ref,
  QueryWeeklyWorkAwardsProps props,
) async {
  final client = await createClient();
  final req = GWorkAwardsReq((builder) {
    return builder
      ..vars.limit = 128
      ..vars.offset = 0
      ..vars.where.year = props.year
      ..vars.where.month = props.month
      ..vars.where.weekIndex = props.weekIndex;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
