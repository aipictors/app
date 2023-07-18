import 'package:aipictors/graphql/mutations/__generated__/create_work_bookmark.data.gql.dart';
import 'package:aipictors/graphql/mutations/__generated__/create_work_bookmark.req.gql.dart';
import 'package:aipictors/mutations/mutate.dart';

typedef Fn<T> = T Function(T);

typedef Builder = Fn<GCreateWorkBookmarkReqBuilder>;

Future<GCreateWorkBookmarkData?> createWorkBookmark(Builder b) {
  return mutate(GCreateWorkBookmarkReq(b));
}
