import 'package:aipictors/client.dart';
import 'package:aipictors/graphql/__generated__/daily_theme.data.gql.dart';
import 'package:aipictors/graphql/__generated__/daily_theme.req.gql.dart';
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
Stream<GDailyThemeData?> queryDailyTheme(
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
  return client.request(req).map((response) {
    return response.data;
  });
}
