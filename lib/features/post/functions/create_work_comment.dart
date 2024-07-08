import 'package:aipictors/features/post/mutations/__generated__/create_work_comment.data.gql.dart';
import 'package:aipictors/features/post/mutations/__generated__/create_work_comment.req.gql.dart';
import 'package:aipictors/utils/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateWorkCommentReqBuilder>;

Future<GCreateWorkCommentData?> createWorkComment(Builder b) {
  return mutate(GCreateWorkCommentReq(b));
}
