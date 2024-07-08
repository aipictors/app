import 'package:aipictors/features/user/mutations/__generated__/report_user.data.gql.dart';
import 'package:aipictors/features/user/mutations/__generated__/report_user.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GReportUserReqBuilder>;

Future<GReportUserData?> reportUser(Builder b) {
  return mutate(GReportUserReq(b));
}
