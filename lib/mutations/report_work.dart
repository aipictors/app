import 'package:aipictors/graphql/mutations/__generated__/report_work.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/report_work.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GReportWorkReqBuilder>;

Future<GReportWorkData?> reportWork(Builder b) {
  return mutate(GReportWorkReq(b));
}
