import 'package:aipictors/features/post/mutations/__generated__/report_work.data.gql.dart';
import 'package:aipictors/features/post/mutations/__generated__/report_work.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GReportWorkReqBuilder>;

Future<GReportWorkData?> reportWork(Builder b) {
  return mutate(GReportWorkReq(b));
}
