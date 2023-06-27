import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/daily_theme.data.gql.dart';
import '../graphql/__generated__/daily_theme.req.gql.dart';
import '../graphql/__generated__/daily_theme.var.gql.dart';

part 'query_daily_theme_provider.g.dart';

class QueryDailyThemeProps extends Equatable {
  const QueryDailyThemeProps({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

typedef State = Stream<OperationResponse<GDailyThemeData, GDailyThemeVars>>;

@riverpod
State queryDailyTheme(
  QueryDailyThemeRef ref,
  QueryDailyThemeProps props,
) {
  final client = createClient();
  final req = GDailyThemeReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.id = props.id;
  });
  return client.request(req);
}
