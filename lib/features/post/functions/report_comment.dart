import 'package:aipictors/graphql/mutations/__generated__/report_comment.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/report_comment.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GReportCommentReqBuilder>;

Future<GReportCommentData?> reportComment(Builder b) {
  return mutate(GReportCommentReq(b));
}
