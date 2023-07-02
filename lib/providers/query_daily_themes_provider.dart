import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/daily_themes.data.gql.dart';
import 'package:aipictors/graphql/__generated__/daily_themes.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_daily_themes_provider.freezed.dart';
part 'query_daily_themes_provider.g.dart';

@freezed
class QueryDailyThemesProps with _$QueryDailyThemesProps {
  const factory QueryDailyThemesProps({
    required int year,
    required int month,
  }) = _QueryDailyThemesProps;
}

@riverpod
Future<GDailyThemesData?> queryDailyThemes(
  QueryDailyThemesRef ref,
  QueryDailyThemesProps props,
) {
  ref.keepAlive();
  final client = createClient();
  final req = GDailyThemesReq((builder) {
    return builder
      ..vars.limit = 40
      ..vars.offset = 0
      ..vars.where.month = props.month
      ..vars.where.year = props.year;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
