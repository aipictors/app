import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/daily_theme.data.gql.dart';
import 'package:aipictors/graphql/__generated__/daily_theme.req.gql.dart';
import 'package:aipictors/utils/to_response_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'query_daily_theme_provider.freezed.dart';
part 'query_daily_theme_provider.g.dart';

@freezed
class QueryDailyThemeProps with _$QueryDailyThemeProps {
  const factory QueryDailyThemeProps({
    required String themeId,
  }) = _QueryDailyThemeProps;
}

@riverpod
Future<GDailyThemeData?> queryDailyTheme(
  QueryDailyThemeRef ref,
  QueryDailyThemeProps props,
) {
  final client = createClient();
  final req = GDailyThemeReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.id = props.themeId;
  });
  final stream = client.request(req).map(toResponseData);
  return stream.first;
}
