import 'package:equatable/equatable.dart';
import 'package:ferry/ferry.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client.dart';
import '../graphql/__generated__/daily_themes.data.gql.dart';
import '../graphql/__generated__/daily_themes.req.gql.dart';
import '../graphql/__generated__/daily_themes.var.gql.dart';

part 'query_daily_themes_provider.g.dart';

class QueryDailyThemesProps extends Equatable {
  const QueryDailyThemesProps({
    required this.year,
    required this.month,
  });

  final int year;

  final int month;

  @override
  List<Object> get props => [year, month];
}

typedef State = Stream<OperationResponse<GDailyThemesData, GDailyThemesVars>>;

@riverpod
State queryDailyThemes(
  QueryDailyThemesRef ref,
  QueryDailyThemesProps props,
) {
  final client = createClient();
  final req = GDailyThemesReq((builder) {
    return builder
      ..vars.limit = 16
      ..vars.offset = 0
      ..vars.where.month = props.month
      ..vars.where.year = props.year;
  });
  return client.request(req);
}
